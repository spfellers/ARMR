##
# This module requires Metasploit: http://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##


require 'msf/core'


class Metasploit3 < Msf::Encoder
  # will be ::XorAdditiveFeedback in the future

  Rank = ExcellentRanking

  OUTPUT_HEX = false
  OUTPUT_BINARY = true
  PRINT_BUFFER = false


  def initialize
    super(
      'Name'             => 'ARMR Encoder',
      'Description'      => %q{
        This encoder implements a polymorphic XOR additive feedback encoder.
        The decoder stub is generated based on dynamic instruction
        substitution and dynamic block ordering.  Registers are also
        selected dynamically.
      },
      'Author'           => 'Team 23',
      'Arch'             => ARCH_CMD,
      'Platform'         => 'unix',
      'EncoderType'      => Msf::Encoder::Type::Unspecified)
  end


  #
  # Encodes the payload
  #
  def encode_block(state, buf)
    for index in 0..(state.badchars.length - 1)
      #remove the bad chars
      buf = remove_badchar(state.badchars[index], buf)
    end

    if PRINT_BUFFER
      puts buf #be nice and print the results for easy viewing
    elsif OUTPUT_BINARY
      puts buf.unpack('B*')[0].scan(/......../).map {|x| x + ' '}.join #print binary
    elsif OUTPUT_HEX
      puts buf.unpack('H*')[0].scan(/../).map {|x| x + ' '}.join #print hex
    end
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
