##
# This module requires Metasploit: http://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##


require 'msf/core'


class Metasploit3 < Msf::Encoder

  Rank = GoodRanking

  SPIT_OUT_BINARY = false

  def initialize
    super(
      'Name'             => 'Echo Command Encoder',
      'Description'      => %q{
        This encoder uses echo and backlash escapes to avoid commonly restricted characters.
      },
      'Author'           => 'hdm',
      'Arch'             => ARCH_CMD,
      'Platform'         => 'unix',
      'EncoderType'      => Msf::Encoder::Type::CmdUnixEcho)
  end


  #
  # Encodes the payload
  #
  def encode_block(state, buf)
    for index in 0..(state.badchars.length - 1)
      #remove the bad chars
      buf = remove_badchar(state.badchars[index], buf)
    end
    puts buf #be nice and print the results for easy viewing
    return buf

  end

  #
  # Uses string's gsub to remove the char
  #
  def remove_badchar(char, buf)
    buf.gsub!(char, '')
    buf
  end

end
