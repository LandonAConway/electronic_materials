--some useful operations & functions
--put them here to keep code cleaner
local function stringStartsWith(str, _start)
    return (str:sub(1,#_start) == _start)
end

local function stringEndsWith(str, _end)
    return (str:sub(0-#_end) == _end)
end


--Storage Devices--
-------------------
electronic_materials.registered_storagedevices = {}

minetest.register_on_mods_loaded(function()
    --document registered storagedevices
    for k, v in pairs(minetest.registered_items) do
        if v.storagedevice then
            electronic_materials.registered_storagedevices[k] = v
        end
    end

    --load active_storagedevices
    electronic_materials.load_active_storagedevices()
end)

minetest.register_on_shutdown(function ()
    --save active_storagedevices
    electronic_materials.save_active_storagedevices()
end)

--storagedevice definition
storagedevice = {
    itemstring = "",
    active_uid = "",
    storage = {}
}

electronic_materials.active_storagedevices = {}

function electronic_materials.save_active_storagedevices()
    electronic_materials.storage.set_string("active_storagedevices",
        minetest.serialize(electronic_materials.active_storagedevices))
end

local function initialize_storagedevice(t)
    for k, v in pairs(storagedevice) do
        t[k] = t[k] or v
    end
    return t
end

function electronic_materials.load_active_storagedevices()
    local saved_storagedevices = minetest.deserialize(
        electronic_materials.storage.get_string("active_storagedevices")) or {}

    for k, v in pairs(saved_storagedevices) do
        electronic_materials[k] = initialize_storagedevice(v)
    end
end

--Generates an active_uid for the storagedevice
local generateUID = function()
    id = 0
    repeat
        id = id + 1
    until( not electronic_materials.active_storagedevices["uid"..id] )
    return "uid"..id
end

--Makes a storage device active
function electronic_materials.activate_storagedevice(itemstack)
    --do not active an item that is not registered to be a storage device
    if not electronic_materials.registered_storagedevices[itemstack:get_name()] then
        return
    end
    local meta = itemstack:get_meta()
    if not electronic_materials.active_storagedevices[meta:get_string("active_uid")] then
        local active_uid = generateUID()

        local _storagedevice = storagedevice
        _storagedevice.itemstring = itemstack:get_name()
        _storagedevice.active_uid = active_uid
        _storagedevice.storage = minetest.deserialize(meta:get_string("storage")) or {}

        meta:set_string("active_uid", active_uid)
        electronic_materials.active_storagedevices[active_uid] = _storagedevice

        return _storagedevice
    end
end

--Makes a storage device inactive
function electronic_materials.deactivate_storagedevice(itemstack)
    local meta = itemstack:get_meta()
    if electronic_materials.active_storagedevices[meta:get_string("active_uid")] then
        local active_uid = meta:get_meta("active_uid")
        local _storagedevice = electronic_materials.active_storagedevices[active_uid]
        
        meta:set_string("active_uid", "")
        meta:set_string("storage", minetest.serialize(_storagedevice.storage))
        electronic_materials.active_storagedevices[active_uid] = nil
    end
    return itemstack
end

--Gets the active storage device from it's itemstack
function storagedevice.get(itemstack)
    local active_uid = itemstack:get_meta():get_string("active_uid")
    if active_uid ~= "" then
        return electronic_materials.active_storagedevices[active_uid]
    end
end

--Functions of storagedevice--
------------------------------

--getDefinition()

--getCapacity()
--getUsedSpace()
--spaceIsAvailable(contents)

--getInvalidPathChars()
--getInvalidNameChars()
--isValidPath(str)
--isValidName(str)
--getFileName(path)
--getExtension(path)
--getDirectoryName(path)

--getContentsAtPath(path)
--setContentsAtPath(path, contents)

--writeSpecialData(path, name, contents)
--readSpecialData(path, name, contents)

--fileExists(path)
--fileGetSize(path)
--fileWrite(path, contents)
--fileRead(path)
--fileCopy(sourcePath, destinationPath, overwrite)
--fileMove(sourcePath, destinationPath, overwrite)
--fileDelete(path)

--directoryExists(path)
--directoryGetSize(path)
--directoryCreate(path, overwrite)
--directoryCopy(sourcePath, destinationPath, overwrite)
--directoryMove(sourcePath, destinationPath, overwrite)
--directoryDelete(path)
--directoryGetAll(path, searchPattern, searchOption)
--directoryGetDirectories(path, searchPattern, searchOption)
--directoryGetFiles(path, searchPattern, searchOption)

function storagedevice.getDefinition(self)
    return minetest.registered_items[self.itemstring]
end

function storagedevice.getCapacity(self)
    return self:getDefinition().storagedevice.capacity
end

function storagedevice.getUsedSpace(self, dir, bytes)
    bytes = bytes or 0
    dir = dir or self.storage
    for k, v in pairs(dir) do
        if type(v) == "string" then
            if stringStartsWith(k,"<") and stringEndsWith(k,">") then
                bytes = bytes + #v
            end
        elseif type(v) == "table" then
            bytes = self:getUsedSpace(v, bytes)
        end
    end
    return bytes
end

function storagedevice.spaceIsAvailable(self, contents)
    local total = self:getCapacity()
    local used = self:getUsedSpace()
    local needed = #contents
    return (used+needed) <= total
end

function storagedevice.getInvalidPathChars(self)
    return {'<','>'}
end

function storagedevice.getInvalidNameChars(self)
    return {'<','>','/'}
end

function storagedevice.isValidPath(self, str)
    local invalidPathChars = {}
    for _, v in pairs(self:getInvalidPathChars()) do
        invalidPathChars[v] = true
    end

    for i = 1, #str do
        local c = str:sub(i,i)
        if invalidPathChars[c] then
            return false
        end
    end
    return true
end

function storagedevice.isValidName(self, str)
    local invalidNameChars = {}
    for _, v in pairs(self:getInvalidNameChars()) do
        invalidNameChars[v] = true
    end

    for i = 1, #str do
        local c = str:sub(i,i)
        if invalidNameChars[c] then
            return false
        end
    end
    return true
end

function storagedevice.getFileName(self, path)
    local segments = string.split(path, "/")
    local count = 0
    for _, _ in pairs(segments) do
        count = count+1
    end
    return segments[count]
end

function storagedevice.getExtension(self, path)
    local build = ""
    for i = #path, 1, -1 do
        local char = path:sub(i,i)
        build = build..char
        if char == "." then
            break;
        end
    end
    local extension = ""
    for i = #build, 1, -1 do
        extension = extension..build:sub(i,i)
    end
    return extension
end

function storagedevice.getDirectoryName(self, path)
    local segments = string.split(path, "/")
    local t = {}
    local count = 0
    for _, _ in pairs(segments) do
        count = count+1
    end
    for i, v in pairs(segments) do
        if i < count then
            table.insert(t, v)
        end
    end
    return table.concat(t, "/")
end

--Gets the contents at the path, of the given table
local getContentsAtDest = function(t, path)
    local segments = string.split(path, "/")
    local currentPath = t
    for i, v in pairs(segments) do
        if currentPath[v] then
            currentPath = currentPath[v]
        else
            return nil
        end
    end
    return currentPath
end

function storagedevice.getContentsAtPath(self, path)
    return getContentsAtDest(self.storage, path)
end

function storagedevice.setContentsAtPath(self, path, contents)
    local directoryName = self:getDirectoryName(path)
    local fileName = self:getFileName(path)
    if fileName and fileName ~= "" then
        local parentContents = getContentsAtDest(self.storage, directoryName)
        parentContents[fileName] = contents
    end
    return false
end

function storagedevice.writeSpecialData(self, path, name, contents)
    local contents = getContentsAtDest(self.storage, path)
    if contents then
        contents["<"..name..">"] = contents
    end
end

function storagedevice.readSpecialData(self, path, name)
    local contents = getContentsAtDest(self.storage, path)
    if contents then
        return contents["<"..name..">"]
    end
end

function storagedevice.fileExists(self, path)
    if not self:isValidPath(path) then
        return false
        -- error("path: \""..path.."\" contains invalid path characters.")
    end
    local contents = getContentsAtDest(self.storage, path)
    if type(contents) == "table" then
        if contents["<data>"] then
            return true
        end
    end
    return false
end

function storagedevice.fileGetSize(self, path)
    if self:fileExists(path) then
        local contents = getContentsAtDest(self.storage, path)
        return self:getUsedSpace(contents)
    end
end

function storagedevice.fileWrite(self, path, contents)
    if type(contents) ~= "string" then
        return false
    end
    --make sure that there is space available
    if not self:spaceIsAvailable(contents) then
        return false
    end
    local directoryName = self:getDirectoryName(path)
    local fileName = self:getFileName(path)
    if self:directoryExists(directoryName) then
        if self:isValidName(fileName) then
            local contents = getContentsAtDest(self.storage, directoryName)
            contents[fileName] = contents[fileName] or {}
            contents[fileName]["<data>"] = contents
            return true
        end
    end
    return false
end

function storagedevice.fileRead(self, path)
    if self:fileExists(path) then
        local contents = getContentsAtDest(self.storage, path)
        return contents["<data>"]
    end
end

function storagedevice.fileCopy(self, sourcePath, destinationPath, overwrite)
    local sourceDirectoryName = self:getDirectoryName(sourcePath)
    local sourceFileName = self:getFileName(sourcePath)
    local destDirectoryName = self:getDirectoryName(destinationPath)
    local destFileName = self:getFileName(destinationPath)
    local destExists = self:fileExists(destinationPath)
    if self:fileExists(sourcePath) and self:directoryExists(destDirectoryName) then
        if not self:fileExists(destinationPath) or self:fileExists(destinationPath) and overwrite == true then
            local sourceDirContent = getContentsAtDest(self.storage, sourceDirectoryName)
            local destDirContent = getContentsAtDest(self.storage, destDirectoryName)
            if not self:spaceIsAvailable(sourceDirContent[sourceFileName]) then
                return false
            end
            destDirContent[destFileName] = table.copy(sourceDirContent[sourceFileName])
            return true
        end
    end
    return false
end

function storagedevice.fileMove(self, sourcePath, destinationPath, overwrite)
    if self:fileCopy(sourcePath, destinationPath, overwrite) then
        self:fileDelete(sourcePath)
        return true
    end
    return false
end

function storagedevice.fileDelete(self, path)
    local directoryName = self:getDirectoryName(path)
    local fileName = self:getFileName(path)
    if self:fileExists(path) then
        local contents = getContentsAtDest(self.storage, directoryName)
        contents[fileName] = nil
        return true
    end
    return false
end

function storagedevice.directoryExists(self, path)
    if not self:isValidPath(path) then
        return false
        --error("path: \""..path.."\" contains invalid path characters.")
    end
    local contents = getContentsAtDest(self.storage, path)
    if type(contents) == "table" then
        if not contents["<data>"] then
            return true
        end
    end
    return false
end

function storagedevice.directoryGetSize(self, path)
    if self:directoryExists(path) then
        local contents = getContentsAtDest(self.storage, path)
        return self:getUsedSpace(contents)
    end
end

function storagedevice.directoryCreate(self, path)
    local segments = string.split(path, "/")
    local current = self.storage
    local result = false
    for i, dest in pairs(segments) do
        if not current[dest] then
            current[dest] = {}
            result = true
        end
        current = current[dest]
    end
    return result
end

function storagedevice.directoryCopy(self, sourcePath, destinationPath, overwrite)
    local sourceDirectoryName = self:getDirectoryName(sourcePath)
    local sourceFolderName = self:getFileName(sourcePath)
    local destDirectoryName = self:getDirectoryName(destinationPath)
    local destFolderName = self:getFileName(destinationPath)
    if self:directoryExists(sourcePath) and self:directoryExists(destDirectoryName) then
        if not self:directoryExists(destinationPath) or self:directoryExists(destinationPath) and overwrite == true then
            local sourceDirContent = getContentsAtDest(self.storage, sourceDirectoryName)
            local destDirContent = getContentsAtDest(self.storage, destDirectoryName)
            if not self:spaceIsAvailable(sourceDirContent[sourceFolderName]) then
                return false
            end
            destDirContent[destFolderName] = table.copy(sourceDirContent[sourceFolderName])
            return true
        end
    end
    return false
end

function storagedevice.directoryMove(self, sourcePath, destinationPath, overwrite)
    if self:directoryCopy(sourcePath, destinationPath, overwrite) then
        self:directoryDelete(sourcePath)
        return true
    end
    return false
end

function storagedevice.directoryDelete(self, path)
    local directoryName = self:getDirectoryName(path)
    local folderName = self:getFileName(path)
    if self:directoryExists(path) then
        local contents = getContentsAtDest(self.storage, directoryName)
        contents[folderName] = nil
        return true
    end
    return false
end

local runSearchFilter = function(searchFilter, fullPath, name)
    if type(searchFilter) == "string" then
        return string.match(name, searchFilter)
    elseif type(searchFilter) == "function" then
        return searchFilter(fullPath, name)
    end
    return true
end

function storagedevice.directoryGetAll(self, path, searchFilter, searchOption, t)
    local current = getContentsAtDest(self.storage, path)
    searchOption = searchOption or "topDirectoryOnly"
    t = t or {}
    
    if current then
        for k, _ in pairs(current) do
            if runSearchFilter(searchFilter, path.."/"..k, k) then
                if self:directoryExists(path.."/"..k) or self:fileExists(path.."/"..k) then
                    table.insert(t, path.."/"..k)
                end
            end
            if searchOption == "allDirectories" then
                if self:directoryExists(path.."/"..k) or self:fileExists(path.."/"..k) then
                    t = self:directoryGetAll(path.."/"..k, searchFilter, searchOption, t)
                end
            end
        end
    end
    
    return t
end

function storagedevice.directoryGetFiles(self, path, searchFilter, searchOption, t)
    local current = getContentsAtDest(self.storage, path)
    searchOption = searchOption or "topDirectoryOnly"
    t = t or {}
    
    if current then
        for k, _ in pairs(current) do
            if runSearchFilter(searchFilter, path.."/"..k, k) then
                if self:fileExists(path.."/"..k) then
                    table.insert(t, path.."/"..k)
                end
            end
            if searchOption == "allDirectories" then
                if self:directoryExists(path.."/"..k) or self:fileExists(path.."/"..k) then
                    t = self:directoryGetFiles(path.."/"..k, searchFilter, searchOption, t)
                end
            end
        end
    end
    
    return t
end

function storagedevice.directoryGetDirectories(self, path, searchFilter, searchOption, t)
    local current = getContentsAtDest(self.storage, path)
    searchOption = searchOption or "topDirectoryOnly"
    t = t or {}
    
    if current then
        for k, _ in pairs(current) do
            if runSearchFilter(searchFilter, path.."/"..k, k) then
                if self:directoryExists(path.."/"..k) then
                    table.insert(t, path.."/"..k)
                end
            end
            if searchOption == "allDirectories" then
                if self:directoryExists(path.."/"..k) or self:fileExists(path.."/"..k) then
                    t = self:directoryGetDirectories(path.."/"..k, searchFilter, searchOption, t)
                end
            end
        end
    end
    
    return t
end