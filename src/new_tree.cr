PARSER_NAME = ARGV[0]

LABEL_ONE   = ARGV[1]
COMMAND_ONE = ARGV[2]

LABEL_TWO   = ARGV[3]
COMMAND_TWO = ARGV[4]

LABEL_TRE   = ARGV[5]
COMMAND_TRE = ARGV[6]

File.open("#{PARSER_NAME}.sh", "w") { |f|
  f.puts "./auto_parser_generic 7 'awa' #{LABEL_ONE} '#{COMMAND_ONE}' #{LABEL_TWO} '#{COMMAND_TWO}' #{LABEL_TRE} '#{COMMAND_TRE}'"
}
