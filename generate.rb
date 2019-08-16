require "csv"

puts("== custom.css Generator ==")

data = CSV.read("./instances.csv", headers: true)

File.open("./custom.css", "w") do |file|
    data.each do |line|
        puts("[#{line["name"]}] #{line["domain"]}")
        file.write(".status a[href^='https://#{line["domain"]}/'] {\n")
        file.write("  border-bottom: solid 1px ##{line["bgcolor"]} ;\n")
        file.write("}\n")
        file.write(".status a[href^='https://#{line["domain"]}/']\n")
        file.write(".display-name:before {\n")
        file.write("  color: ##{line["textcolor"]} !important ;\n")
        file.write("  background-color: ##{line["bgcolor"]} !important ;\n")
        file.write("  content: '[#{line["name"]}]' !important ;\n")
        file.write("}\n")
        file.write(".status a[href^='https://#{line["domain"]}/'].u-url.mention {\n")
        file.write("  color: ##{line["textcolor"]} !important ;\n")
        file.write("  background-color: ##{line["bgcolor"]} !important ;\n")
        file.write("}\n")
    end
end

puts("== END ==")
