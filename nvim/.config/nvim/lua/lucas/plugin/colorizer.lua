local setup_colorizer, colorizer = pcall(require, "colorizer")

if not setup_colorizer then
	print("Colorizer not found")
	return
end

colorizer.setup()
