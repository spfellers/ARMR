##
# This module requires Metasploit: http://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##

=begin

http://www.exploit-db.com/sploits/w32-speaking-shellcode.zip

Copyright (c) 2009-2010 Berend-Jan "SkyLined" Wever <berendjanwever@gmail.com>
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the copyright holder nor the names of the
      contributors may be used to endorse or promote products derived from
      this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=end

require 'msf/core'
require 'msf/core/payload/windows/exec'


module Metasploit3
  #remote shell connecting back to 127.0.0.1:4920

  CachedSize = 247

  include Msf::Payload::Windows
  include Msf::Payload::Single

  def initialize(info = {})
    super(update_info(info,
      'Name'          => 'Windows Speech API - Say "You Got Pwned!"',
      'Description'   => 'Causes the target to say "You Got Pwned" via the Windows Speech API',
      'Author'        => [ 'Berend-Jan "SkyLined" Wever <berendjanwever[at]gmail.com>' ],
      'License'       => BSD_LICENSE,
      'Platform'      => 'win',
      'Arch'          => ARCH_X86,
      'Privileged'    => false,
      'Payload'       =>
      {
        'Offsets' => { },
        'Payload' => 'Hello World'
      }
      ))

    # EXITFUNC is not supported :/
    deregister_options('EXITFUNC')
  end

end
