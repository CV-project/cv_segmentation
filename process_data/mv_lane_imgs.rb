img_names = Dir['train/*.jpg']
img_names = img_names.map{|x| x[6..22]}

img_names.each do |ts|
    puts ts
    system("cp ../raw_data/Lane_label/#{ts}* train_lane_labels")
end


img_names = Dir['test/*.jpg']
img_names = img_names.map{|x| x[5..21]}

img_names.each do |ts|
    puts ts
    system("cp ../raw_data/Lane_label/#{ts}* test_lane_labels")
end


img_names = Dir['val/*.jpg']
img_names = img_names.map{|x| x[4..20]}

img_names.each do |ts|
    puts ts
    system("cp ../raw_data/Lane_label/#{ts}* val_lane_labels")
end
