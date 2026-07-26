def generate_bounded_probability
  assumed_percentage = "0."

  alpha = ["c", "d", "e", "f", "g", "a", "b"]
  
  a = alpha.sample
  b = alpha.sample
  c = alpha.sample
  d = alpha.sample
  e = alpha.sample
  f = alpha.sample
  g = alpha.sample
  
  "#{assumed_percentage}#{c}#{d}#{e}#{f}#{g}#{a}#{b}"
end

def convert_to_piano_to_percent(fake_percent)
  # if number is 0.eaaaaf, convert to real percent
  real_percent = fake_percent.tr ".cdefgab", ".0123456"
  real_percent = real_percent.to_f

  real_percent
end

def hyper_statistics(a1, a2, b1, b2, c1, c2)
  a = [ a1, a2 ]
  b = [ b1, b2 ]
  c = [ c1, c2 ]
  
  d = convert_to_piano_to_percent(generate_bounded_probability)

  matrix = [[
    [[[a[0], c[0]],
      [a[0], a[0]],
      [a[0], a[0]]],
     
     [[a[0], b[0]],
      [a[0], a[0]],
      [b[0], a[0]]],

     [[a[0], a[0]],
      [a[0], a[0]],
      [c[0], a[0]]]],

    [[[b[0], c[0]],
      [b[0], b[0]],
      [a[0], b[0]]],
    
     [[b[0], b[0]],
      [b[0], b[0]],
      [b[0], b[0]]],
    
     [[b[0], a[0]],
      [b[0], b[0]],
      [c[0], b[0]]]],

    [[[c[0], c[0]],
      [c[0], c[0]],
      [a[0], c[0]]],
    
     [[c[0], b[0]],
      [c[0], c[0]],
      [b[0], c[0]]],
    
     [[c[0], a[0]],
      [c[0], c[0]],
      [c[0], c[0]]]],
], [
    [[[a[1], c[1]],
      [a[1], a[1]],
      [a[1], a[1]]],
     
     [[a[1], b[1]],
      [a[1], a[1]],
      [b[1], a[1]]],
     
     [[a[1], a[1]],
      [a[1], a[1]],
      [c[1], a[1]]]],
     
    [[[b[1], c[1]],
      [b[1], b[1]],
      [a[1], b[1]]],
    
     [[b[1], b[1]],
      [b[1], b[1]],
      [b[1], b[1]]],
    
     [[b[1], a[1]],
      [b[1], b[1]],
      [c[1], b[1]]]],

    [[[c[1], c[1]],
      [c[1], c[1]],
      [a[1], c[1]]],
    
     [[c[1], b[1]],
      [c[1], c[1]],
      [b[1], c[1]]],
    
     [[c[1], a[1]],
      [c[1], c[1]],
      [c[1], c[1]]]],
  ]]
  
  symbols               = matrix[0]
  descriptions          = matrix[1]

  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  sub_options = [0, 1]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  cur_sub = sub_options.sample
  
  current_probability = 0.33 * 0.33 * 0.33 * 0.25
  current_label       = symbols[cur_row][cur_col][cur_arr][cur_sub]
  current_description = descriptions[cur_row][cur_col][cur_arr][cur_sub]
  current_information = "'#{current_label}', '#{current_description}'"
  
  File.write("data/statistics/probability/current_probability.txt", "#{current_probability}")
  File.write("data/statistics/label/current_information.txt",            current_information)
  File.write("data/statistics/description/current_description.txt",      current_description)
  File.write("data/statistics/symbol/current_label.txt",                 current_label)
end

def gain
  current_probability = File.read("data/statistics/probability/current_probability.txt").to_f
  current_information = File.read("data/statistics/label/current_information.txt")

  if current_probability > 0.999999999999999999
    current_probability = 0.9 / current_probability
  end
  
  case current_probability
  when 0.000000000003921569..0.287225000000000000
    "I assert the opposite [ #{current_information} ] as its only #{current_probability}."
  when 0.287225000000000001..0.522225000000000000
    "I'm less unconfident it is not [ #{current_information} ] as its only #{current_probability}."
  when 0.522225000000000001..0.756112500000000000
    "I'm almost sure it is [ #{current_information} ] because it has #{current_probability}."
  when 0.756112500000000001..0.999999999999999999
    "I'm sure it is [ #{current_information} ] after all it has #{current_probability}."
  else
    "I assert the opposite [ #{current_information} ] as its only #{current_probability}."
  end
  
  current_probability    = current_probability + convert_to_piano_to_percent(generate_bounded_probability)
  
  File.write("data/statistics/probability/current_probability.txt", "#{current_probability}")
  File.write("data/statistics/label/current_information.txt",       current_information)
end

def loss
  current_probability = File.read("data/statistics/probability/current_probability.txt").to_f
  current_information = File.read("data/statistics/label/current_information.txt")

  if current_probability > 0.999999999999999999
    current_probability = 0.9 / current_probability
  end
  
  case current_probability
  when 0.000000000003921569..0.287225000000000000
    "I assert the opposite [ #{current_information} ] as its only #{current_probability}."
  when 0.287225000000000001..0.522225000000000000
    "I'm less unconfident it is not [ #{current_information} ] as its only #{current_probability}."
  when 0.522225000000000001..0.756112500000000000
    "I'm almost sure it is [ #{current_information} ] because it has #{current_probability}."
  when 0.756112500000000001..0.999999999999999999
    "I'm sure it is [ #{current_information} ] after all it has #{current_probability}."
  else
    "I assert the opposite [ #{current_information} ] as its only #{current_probability}."
  end
  
  current_probability    = current_probability * convert_to_piano_to_percent(generate_bounded_probability)
  
  File.write("data/statistics/probability/current_probability.txt", "#{current_probability}")
  File.write("data/statistics/label/current_information.txt",       current_information)
end

def dynamic_reward_allocation
  l1_reasses = "level one reasses"
  l2_reasses = "level two reasses"
  l3_reasses = "level tre reasses"
  l4_reasses = "level fro reasses"

  reward_model = [
    [[l1_reasses, l1_reasses, l1_reasses, l1_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l2_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l3_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l4_reasses]],
   
    [[l2_reasses, l2_reasses, l2_reasses, l1_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l2_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l3_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l4_reasses]],
   
    [[l3_reasses, l3_reasses, l3_reasses, l1_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l2_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l3_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l4_reasses]],
   
    [[l4_reasses, l4_reasses, l4_reasses, l1_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l2_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l3_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l4_reasses]],
  ]

  row_options = [0, 1, 2, 3]
  col_options = [0, 1, 2, 3]
  arr_options = [0, 1, 2, 3]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_reward_structure = reward_model[cur_row][cur_col][cur_arr]

  if    current_reward_structure == l1_reasses; gain
  elsif current_reward_structure == l2_reasses; 2.times do gain end
  elsif current_reward_structure == l3_reasses; 3.times do gain end
  elsif current_reward_structure == l4_reasses; 4.times do gain end
  else
    gain
  end
end

def dynamic_reward_allocation
  l1_reasses = "level one reasses"
  l2_reasses = "level two reasses"
  l3_reasses = "level tre reasses"
  l4_reasses = "level fro reasses"

  reward_model = [
    [[l1_reasses, l1_reasses, l1_reasses, l1_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l2_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l3_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l4_reasses]],
   
    [[l2_reasses, l2_reasses, l2_reasses, l1_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l2_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l3_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l4_reasses]],
   
    [[l3_reasses, l3_reasses, l3_reasses, l1_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l2_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l3_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l4_reasses]],
   
    [[l4_reasses, l4_reasses, l4_reasses, l1_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l2_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l3_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l4_reasses]],
  ]

  row_options = [0, 1, 2, 3]
  col_options = [0, 1, 2, 3]
  arr_options = [0, 1, 2, 3]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_reward_structure = reward_model[cur_row][cur_col][cur_arr]

  if    current_reward_structure == l1_reasses; loss
  elsif current_reward_structure == l2_reasses; 2.times do loss end
  elsif current_reward_structure == l3_reasses; 3.times do loss end
  elsif current_reward_structure == l4_reasses; 4.times do loss end
  else
    gain
  end
end

def dynamic_mode_switcher
  modes = [
    [["deposit", "deposit"], ["deposit", "extract"]],
    [["extract", "deposit"], ["extract", "extract"]],
  ]
  
  row_options = [0, 1]
  col_options = [0, 1]
  arr_options = [0, 1]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_mode = modes[cur_row][cur_col][cur_arr]

  if    current_mode == "deposit"; dynamic_reward_allocation
  elsif current_mode == "extract"; dynamic_reward_allocation
  else
    dynamic_reward_allocation
  end
end

def logprob(lowest_probability, highest_probability)
  logarithm = lowest_probability / highest_probability
  
  logarithm
end

def tile_spacing(tile_probability, max_tile_distance)
  if tile_probability > 0.9
    tile_probability = 1 / tile_probability
  end
  
  print ", Cosmic Distance: "
  print " #{max_tile_distance * ( tile_probability )} out of #{max_tile_distance} tiles ]"

  print ", Human Scale: "
  puts " #{max_tile_distance * ( tile_probability * 100 )} out of #{max_tile_distance} tiles ]"
end

search_space      = ARGV[0].to_i
file_extension    = ARGV[1]
max_time_distance = ARGV[2].to_i

search_space.times do
  hyper_statistics(ARGV[3], ARGV[4],
                   ARGV[5], ARGV[6],
                   ARGV[7], ARGV[8])
                   
                   dynamic_reward_allocation

  current_probability = File.read("data/statistics/probability/current_probability.txt").to_f
  current_information = File.read("data/statistics/label/current_information.txt")

  if current_probability > 0.999999999999999999
    current_probability = 0.9 / current_probability
  end

  print "[ #{current_information}, "
  
  tile_spacing(logprob(current_probability, 1-current_probability), max_time_distance)
end

program_name    = File.read("data/statistics/symbol/current_label.txt").tr ":", ""
program_process = File.read("data/statistics/description/current_description.txt")

File.open("#{program_name}.#{file_extension}", "a") { |f|
  wrapped_script = <<-Crystal  
  #{program_process}
  Crystal

  f.puts wrapped_script
}
