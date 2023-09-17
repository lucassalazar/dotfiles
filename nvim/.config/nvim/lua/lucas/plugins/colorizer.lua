local colorizer_status, colorize = pcall(require, "colorizer")

if not colorizer_status then
    return
end

colorize.setup()
