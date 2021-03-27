#
#  Panoramix v4 Oct 2019 
#  Decompiled source of bsc:0x0000000000A761723372dD6bFB6C3346C3Ba8Ad1
# 
#  Let's make the world open source 
# 
#
#  I failed with these: 
#  - unknown051ff106(?)
#  - unknown44c3159d(?)
#  - unknown5321bd3f(?)
#  - unknown724ec9b7(?)
#  - unknown82cb68c3(?)
#  - unknown82f0878b(?)
#  - unknownae44042b(?)
#  All the rest is below.
#

def storage:
  stor0 is array of addr at storage 0
  stor1 is uint256 at storage 1
  stor2 is uint256 at storage 2

def _fallback() payable: # default function
  stop

def unknownf0d2c1ae(): # not payable
  if stor2 > stor1:
      revert with 0, 'SafeMath#sub: UNDERFLOW'
  return (stor1 - stor2)

def transferOwner(address _newOwner): # not payable
  require calldata.size - 4 >=′ 32
  require _newOwner == _newOwner
  idx = 0
  while idx < stor0.length:
      mem[0] = 0
      if stor0[idx] != caller:
          idx = idx + 1
          continue 
      require 0 < stor0.length
      stor0 = _newOwner
      stop
  revert with 0, 'Ownable: caller is not the owner'

def addOwner(address _owner): # not payable
  require calldata.size - 4 >=′ 32
  require _owner == _owner
  idx = 0
  while idx < stor0.length:
      mem[0] = 0
      if stor0[idx] != caller:
          idx = idx + 1
          continue 
      stor0.length++
      stor0[stor0.length] = _owner
      stop
  revert with 0, 'Ownable: caller is not the owner'

def unknownf98bea15(uint256 _param1): # not payable
  require calldata.size - 4 >=′ 32
  idx = 0
  while idx < stor0.length:
      mem[0] = 0
      if stor0[idx] != caller:
          idx = idx + 1
          continue 
      call caller with:
         value _param1 wei
           gas 2300 * is_zero(value) wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      stop
  revert with 0, 'Ownable: caller is not the owner'

def unknown4e138e86(uint256 _param1): # not payable
  require calldata.size - 4 >=′ 32
  idx = 0
  while idx < stor0.length:
      mem[0] = 0
      if stor0[idx] != caller:
          idx = idx + 1
          continue 
      require ext_code.size(0x5545153ccfca01fbd7dd11c0b23ba694d9509a6f)
      call 0x5545153ccfca01fbd7dd11c0b23ba694d9509a6f.withdraw(uint256 amount) with:
           gas gas_remaining wei
          args _param1
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      call caller with:
         value _param1 wei
           gas 2300 * is_zero(value) wei
      stop
  revert with 0, 'Ownable: caller is not the owner'

def unknown93c4f98f(uint256 _param1): # not payable
  require calldata.size - 4 >=′ 32
  idx = 0
  while idx < stor0.length:
      mem[0] = 0
      if stor0[idx] != caller:
          idx = idx + 1
          continue 
      require ext_code.size(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)
      call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.withdraw(uint256 amount) with:
           gas gas_remaining wei
          args _param1
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      call caller with:
         value _param1 wei
           gas 2300 * is_zero(value) wei
      stop
  revert with 0, 'Ownable: caller is not the owner'

def unknowne2d7f9b3(uint256 _param1, uint256 _param2): # not payable
  require calldata.size - 4 >=′ 64
  require _param2 == addr(_param2)
  idx = 0
  while idx < stor0.length:
      mem[0] = 0
      if stor0[idx] != caller:
          idx = idx + 1
          continue 
      require ext_code.size(addr(_param2))
      call addr(_param2).withdraw(uint256 amount) with:
           gas gas_remaining wei
          args _param1
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      call caller with:
         value _param1 wei
           gas 2300 * is_zero(value) wei
      stop
  revert with 0, 'Ownable: caller is not the owner'

def unknowne2da3653(uint256 _param1, uint256 _param2): # not payable
  require calldata.size - 4 >=′ 64
  require _param1 == addr(_param1)
  idx = 0
  while idx < stor0.length:
      mem[0] = 0
      if stor0[idx] != caller:
          idx = idx + 1
          continue 
      require ext_code.size(addr(_param1))
      call addr(_param1).transfer(address to, uint256 value) with:
           gas gas_remaining wei
          args caller, _param2
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >=′ 32
      require ext_call.return_data == bool(ext_call.return_data[0])
      stop
  revert with 0, 'Ownable: caller is not the owner'

def unknown7f7d6e34(uint256 _param1): # not payable
  require calldata.size - 4 >=′ 32
  idx = _param1 / 32
  s = stor1
  while idx:
      create2 contract with 0 wei
                      salt: s
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 1)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 2)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 3)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 4)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 5)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 6)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 7)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 8)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 9)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 10)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 11)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 12)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 13)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 14)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 15)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 16)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 17)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 18)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 19)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 20)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 21)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 22)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 23)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 24)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 25)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 26)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 27)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 28)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 29)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 30)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      create2 contract with 0 wei
                      salt: (s + 31)
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      idx = idx - 1
      s = s + 32
      continue 
  idx = _param1 % 32
  t = s
  while idx:
      create2 contract with 0 wei
                      salt: t
                      code: 0x756ea761723372dd6bfb6c3346c3ba8ad13318585733ff6000526016600af3
      idx = idx - 1
      t = t + 1
      continue 
  stor1 = t

