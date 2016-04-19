# Will probably require our counterpart to Rex::Arch::x86

class LogicalRegister::ARM < LogicalRegister

  # Lists registers usable in ARM architecture.
  def self.regnum_set
    [
        #Example:
        #Rex::Arch::X86::EAX,
        #Rex::Arch::X86::EBC,
        #etc. One for each register number
        #constant in Rex::Arch::ARM.
        Rex::Arch::ARM::R0,
        Rex::Arch::ARM::R1,
        Rex::Arch::ARM::R2,
        Rex::Arch::ARM::R3,
        Rex::Arch::ARM::R4,
        Rex::Arch::ARM::R5,
        Rex::Arch::ARM::R6,
        Rex::Arch::ARM::R7
    ]
  end

  def initialize(name, register = nil)
    super(name, register ? Rex::Arch::ARM.reg_number(register) : nil)
  end

end