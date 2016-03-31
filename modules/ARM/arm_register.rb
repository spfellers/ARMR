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
    ]
  end

  def initialize(name, register = nil)
    #super(name, register ? Rex::Arch::X86.reg_number(register) : nil)
  end

end