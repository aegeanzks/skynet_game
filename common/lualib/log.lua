local skynet = require "skynet"

local log = {
	prefix = {
		"[debug]",
		"[info]",
		"[notice]",
		"[warning]",
		"[error]",
	},
}

local level
function log.level(lv)
	level = lv
end

local function write(priority, ...)
	if priority >= level then
		skynet.error(log.prefix[priority], ...)
	end
end

local function writef(priority, ...)
	if priority >= level then
		skynet.error(log.prefix[priority] .. string.format(...))
	end
end

function log.debug(...)
	write(1, ...)
end

function log.debugf(...)
	writef(1, ...)
end

function log.info(...)
	write(2, ...)
end

function log.infof(...)
	writef(2, ...)
end

function log.notice(...)
	write(3, ...)
end

function log.noticef(...)
	writef(3, ...)
end

function log.warning(...)
	write(4, ...)
end

function log.warningf(...)
	writef(4, ...)
end

function log.err(...)
	write(5, ...)
end

function log.errf(...)
	writef(5, ...)
end

log.level(tonumber(skynet.getenv("logLevel")) or 3)
return log
