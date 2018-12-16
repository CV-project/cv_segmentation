data_home = "../data_baidu_apollo"

image_ts = File.readlines("#{data_home}/raw_data/image_list_ts.txt")
image_ts = image_ts.map{|x| x.strip}

image_ts.shuffle!
train_ts = image_ts[1..500]
test_ts  = image_ts[1001..1200]
val_ts   = image_ts[2001..2200]

system("mkdir -p #{data_home}/train")
system("mkdir -p #{data_home}/train_labels")
system("mkdir -p #{data_home}/test")
system("mkdir -p #{data_home}/test_labels")
system("mkdir -p #{data_home}/val")
system("mkdir -p #{data_home}/val_labels")

# split color image train
train_ts.each do |ts|
    print("train: #{ts}\n")
    system("cp #{data_home}/raw_data/ColorImage/#{ts}* #{data_home}/train")
    system("cp #{data_home}/raw_data/Label/#{ts}* #{data_home}/train_labels")
end

test_ts.each do |ts|
    print("test: #{ts}\n")
    system("cp #{data_home}/raw_data/ColorImage/#{ts}* #{data_home}/test")
    system("cp #{data_home}/raw_data/Label/#{ts}* #{data_home}/test_labels")
end

val_ts.each do |ts|
    print("val: #{ts}\n")
    system("cp #{data_home}/raw_data/ColorImage/#{ts}* #{data_home}/val")
    system("cp #{data_home}/raw_data/Label/#{ts}* #{data_home}/val_labels")
end
