##
# This module requires Metasploit: http://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##


require 'msf/core'


class Metasploit3 < Msf::Encoder::XorAdditiveFeedback

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

  # Indicate that this module can preserve some registers
  def can_preserve_registers?
    true
  end

  # A list of registers always touched by this encoder
  def modified_registers
    # ESP is assumed and is handled through preserves_stack?
    [
        # The counter register is hardcoded
        Rex::Arch::ARM::R3,
        # These are modified by div and mul operations
        Rex::Arch::ARM::V1, Rex::Arch::ARM::V2
    ]
  end

  # Always blacklist these registers in our block generation
  def block_generator_register_blacklist
    [Rex::Arch::ARM::SP, Rex::Arch::ARM::R3] | saved_registers
  end


  #
  # Encodes the payload
  # Currently superfluous, since XorAdditiveFeedback's encode_block is used
  #
  def old_encode_block(state, buf)
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
