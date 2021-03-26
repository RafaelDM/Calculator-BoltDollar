#
#  Panoramix v4 Oct 2019 
#  Decompiled source of bsc:0x98CCa77A9d642aeBb1765716061A0cEB92ed0af1
# 
#  Let's make the world open source 
# 
#
#  I failed with these: 
#  - withdrawETH()
#  - _fallback()
#  All the rest is below.
#

def storage:
  owner is addr at storage 0
  unknown1694505eAddress is addr at storage 1
  wethAddress is addr at storage 2
  maxAmount is uint256 at storage 3
  stor4 is mapping of uint8 at storage 4
  coins is mapping of uint256 at storage 5

def unknown1694505e(): # not payable
  return unknown1694505eAddress

def weth(): # not payable
  return wethAddress

def maxAmount(): # not payable
  return maxAmount

def coins(address _param1): # not payable
  require calldata.size - 4 >= 32
  return coins[_param1]

def owner(): # not payable
  return owner

def users(address _param1): # not payable
  require calldata.size - 4 >= 32
  return bool(stor4[_param1])

#
#  Regular functions
#

def unknown088e5840(addr _param1): # not payable
  require calldata.size - 4 >= 32
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  wethAddress = _param1

def unknown340ac20f(addr _param1): # not payable
  require calldata.size - 4 >= 32
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  unknown1694505eAddress = _param1

def add(address _address): # not payable
  require calldata.size - 4 >= 32
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  stor4[addr(_address)] = 1

def approve(address _guy): # not payable
  require calldata.size - 4 >= 32
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  require ext_code.size(_guy)
  call _guy.approve(address spender, uint256 value) with:
       gas gas_remaining wei
      args unknown1694505eAddress, maxAmount^18
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32

def withdrawERC20(address _contractAddress, uint256 _amount): # not payable
  require calldata.size - 4 >= 64
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  require ext_code.size(_contractAddress)
  call _contractAddress.transfer(address to, uint256 value) with:
       gas gas_remaining wei
      args caller, _amount
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32

def unknownd61e031e(addr _param1, uint256 _param2): # not payable
  require calldata.size - 4 >= 64
  if bool(stor4[caller]) != 1:
      revert with 0, 'Who are you ?'
  require ext_code.size(wethAddress)
  call wethAddress.withdraw(uint256 amount) with:
       gas gas_remaining wei
      args _param2
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  call _param1 with:
     value _param2 wei
       gas 2300 * is_zero(value) wei

def unknown5a65a203(addr _param1): # not payable
  require calldata.size - 4 >= 32
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  require ext_code.size(_param1)
  static call _param1.balanceOf(address owner) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(_param1)
  call _param1.transfer(address to, uint256 value) with:
       gas gas_remaining wei
      args caller, ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32

def unknown2b53b397() payable: 
  require calldata.size - 4 >= 32
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 4).length <= 4294967296 and cd * ('cd', 4).length) + 36 <= calldata.size
  if bool(stor4[caller]) != 1:
      revert with 0, 'Who are you ?'
  require 0 < ('cd', 4).length
  if coins[addr(('cd', 4))] == block.number:
      revert with 0, ':('
  require 0 < ('cd', 4).length
  require ext_code.size(addr(('cd', 4)))
  static call addr(('cd', 4)).balanceOf(address owner) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(addr(('cd', 4)))
  call addr(('cd', 4)).approve(address spender, uint256 value) with:
       gas gas_remaining wei
      args unknown1694505eAddress, ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  mem[96] = 0x38ed173900000000000000000000000000000000000000000000000000000000
  mem[100] = ext_call.return_data[0]
  mem[132] = 0
  mem[196] = this.address
  mem[228] = block.timestamp
  mem[164] = 160
  mem[260] = ('cd', 4).length
  mem[292 len 32 * ('cd', 4).length] = call.data[cd * ('cd', 4).length]
  mem[(32 * ('cd', 4).length) + 292] = 0
  require ext_code.size(unknown1694505eAddress)
  call unknown1694505eAddress.0x38ed1739 with:
       gas gas_remaining wei
      args 0, ext_call.return_dataaddr(this.address), block.timestamp, ('cd', 4).length, call.data[cd('cd', 4).length)]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[96 len return_data.size] = ext_call.return_data[0 len return_data.size]
  mem[64] = ceil32(return_data.size) + 96
  require return_data.size >= 32
  require mem[96 len 4], ext_call.return_data <= 4294967296
  require mem[96 len 4], ext_call.return_data <= return_data.size
  require mem[mem[96 len 4], ext_call.return_data] <= 4294967296 and mem[96 len 4], ext_call.return_data * mem[mem[96 len 4], ext_call.return_data]) + 32 <= return_data.size

def unknown56159c62() payable: 
  require calldata.size - 4 >= 64
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 4).length <= 4294967296 and cd * ('cd', 4).length) + 36 <= calldata.size
  if bool(stor4[caller]) != 1:
      revert with 0, 'Who are you ?'
  require 0 < ('cd', 4).length
  require ext_code.size(addr(('cd', 4)))
  static call addr(('cd', 4)).balanceOf(address owner) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  mem[96] = 0xd06ca61f00000000000000000000000000000000000000000000000000000000
  mem[100] = ext_call.return_data[0]
  mem[132] = 64
  mem[164] = ('cd', 4).length
  mem[196 len 32 * ('cd', 4).length] = call.data[cd * ('cd', 4).length]
  mem[(32 * ('cd', 4).length) + 196] = 0
  require ext_code.size(unknown1694505eAddress)
  static call unknown1694505eAddress.0xd06ca61f with:
          gas gas_remaining wei
         args ext_call.return_dataArray(len=('cd', 4).length, data=call.data[cd('cd', 4).length)])
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[96 len return_data.size] = ext_call.return_data[0 len return_data.size]
  mem[64] = ceil32(return_data.size) + 96
  require return_data.size >= 32
  _11 = mem[96 len 4], ext_call.return_data[0 len 28]
  require mem[96 len 4], ext_call.return_data <= 4294967296
  require mem[96 len 4], ext_call.return_data <= return_data.size
  require mem[mem[96 len 4], ext_call.return_data] <= 4294967296 and mem[96 len 4], ext_call.return_data * mem[mem[96 len 4], ext_call.return_data]) + 32 <= return_data.size
  mem[ceil32(return_data.size) + 96] = mem[mem[96 len 4], ext_call.return_data]
  _14 = mem[_11 + 96]
  mem[ceil32(return_data.size) + 128 len floor32(mem[_11 + 96])] = mem[_11 + 128 len floor32(mem[_11 + 96])]
  require 1 < mem[ceil32(return_data.size) + 96]
  if mem[ceil32(return_data.size) + 160] < cd[36]:
      revert with 0, 'Opps'
  require ext_code.size(addr(('cd', 4)))
  call addr(('cd', 4)).approve(address spender, uint256 value) with:
       gas gas_remaining wei
      args unknown1694505eAddress, ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  mem[(32 * _14) + ceil32(return_data.size) + 128] = 0x38ed173900000000000000000000000000000000000000000000000000000000
  mem[(32 * _14) + ceil32(return_data.size) + 132] = ext_call.return_data[0]
  mem[(32 * _14) + ceil32(return_data.size) + 164] = 0
  mem[(32 * _14) + ceil32(return_data.size) + 228] = this.address
  mem[(32 * _14) + ceil32(return_data.size) + 260] = block.timestamp
  mem[(32 * _14) + ceil32(return_data.size) + 196] = 160
  mem[(32 * _14) + ceil32(return_data.size) + 292] = ('cd', 4).length
  mem[(32 * _14) + ceil32(return_data.size) + 324 len 32 * ('cd', 4).length] = call.data[cd * ('cd', 4).length]
  mem[(32 * _14) + ceil32(return_data.size) + (32 * ('cd', 4).length) + 324] = 0
  require ext_code.size(unknown1694505eAddress)
  call unknown1694505eAddress.0x38ed1739 with:
       gas gas_remaining wei
      args ext_call.return_dataaddr(this.address), block.timestamp, ('cd', 4).length, call.data[cd('cd', 4).length)]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[(32 * _14) + ceil32(return_data.size) + 128 len return_data.size] = ext_call.return_data[0 len return_data.size]
  mem[64] = (32 * _14) + (2 * ceil32(return_data.size)) + 128
  require return_data.size >= 32
  require mem[(32 * _14) + ceil32(return_data.size) + 128 len 4], ext_call.return_data <= 4294967296
  require mem[(32 * _14) + ceil32(return_data.size) + 128 len 4], ext_call.return_data <= return_data.size
  require mem[mem[(32 * _14) + ceil32(return_data.size) + 128 len 4], ext_call.return_data * _14) + ceil32(return_data.size) + 128] <= 4294967296 and mem[(32 * _14) + ceil32(return_data.size) + 128 len 4], ext_call.return_data * mem[mem[(32 * _14) + ceil32(return_data.size) + 128 len 4], ext_call.return_data * _14) + ceil32(return_data.size) + 128]) + 32 <= return_data.size

def unknown6e15ebb6() payable: 
  require calldata.size - 4 >= 128
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 36).length <= 4294967296 and cd * ('cd', 36).length) + 36 <= calldata.size
  if bool(stor4[caller]) != 1:
      revert with 0, 'Who are you ?'
  require 0 < ('cd', 36).length
  require ext_code.size(addr(('cd', 36)))
  static call addr(('cd', 36)).balanceOf(address owner) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  mem[96] = 0xd06ca61f00000000000000000000000000000000000000000000000000000000
  mem[100] = cd[68]
  mem[132] = 64
  mem[164] = ('cd', 36).length
  mem[196 len 32 * ('cd', 36).length] = call.data[cd * ('cd', 36).length]
  mem[(32 * ('cd', 36).length) + 196] = 0
  require ext_code.size(unknown1694505eAddress)
  static call unknown1694505eAddress.0xd06ca61f with:
          gas gas_remaining wei
         args cdArray(len=('cd', 36).length, data=call.data[cd('cd', 36).length)])
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[96 len return_data.size] = ext_call.return_data[0 len return_data.size]
  mem[64] = ceil32(return_data.size) + 96
  require return_data.size >= 32
  _11 = mem[96 len 4], Mask(224, 32, cd >> 32
  require mem[96 len 4], Mask(224, 32, cd >> 32 <= 4294967296
  require mem[96 len 4], Mask(224, 32, cd >> 32 + 32 <= return_data.size
  require mem[mem[96 len 4], Mask(224, 32, cd >> 32 + 96] <= 4294967296 and mem[96 len 4], Mask(224, 32, cd >> 32 + (32 * mem[mem[96 len 4], Mask(224, 32, cd >> 32 + 96]) + 32 <= return_data.size
  mem[ceil32(return_data.size) + 96] = mem[mem[96 len 4], Mask(224, 32, cd >> 32 + 96]
  _14 = mem[_11 + 96]
  mem[ceil32(return_data.size) + 128 len floor32(mem[_11 + 96])] = mem[_11 + 128 len floor32(mem[_11 + 96])]
  require 1 < mem[ceil32(return_data.size) + 96]
  if mem[ceil32(return_data.size) + 160] < cd[100]:
      revert with 0, 'Opps'
  require ext_code.size(addr(('cd', 36)))
  call addr(('cd', 36)).approve(address spender, uint256 value) with:
       gas gas_remaining wei
      args unknown1694505eAddress, ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  mem[(32 * _14) + ceil32(return_data.size) + 128] = 0x38ed173900000000000000000000000000000000000000000000000000000000
  mem[(32 * _14) + ceil32(return_data.size) + 132] = cd[68]
  mem[(32 * _14) + ceil32(return_data.size) + 164] = cd[100]
  mem[(32 * _14) + ceil32(return_data.size) + 228] = this.address
  mem[(32 * _14) + ceil32(return_data.size) + 260] = block.timestamp
  mem[(32 * _14) + ceil32(return_data.size) + 196] = 160
  mem[(32 * _14) + ceil32(return_data.size) + 292] = ('cd', 36).length
  mem[(32 * _14) + ceil32(return_data.size) + 324 len 32 * ('cd', 36).length] = call.data[cd * ('cd', 36).length]
  mem[(32 * _14) + ceil32(return_data.size) + (32 * ('cd', 36).length) + 324] = 0
  require ext_code.size(addr(cd))
  call addr(cd).0x38ed1739 with:
       gas gas_remaining wei
      args cdArray(len=('cd', 36).length, data=call.data[cd('cd', 36).length)]), addr(this.address), block.timestamp
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[(32 * _14) + ceil32(return_data.size) + 128 len return_data.size] = ext_call.return_data[0 len return_data.size]
  mem[64] = (32 * _14) + (2 * ceil32(return_data.size)) + 128
  require return_data.size >= 32
  require mem[(32 * _14) + ceil32(return_data.size) + 128 len 4], Mask(224, 32, cd >> 32 <= 4294967296
  require mem[(32 * _14) + ceil32(return_data.size) + 128 len 4], Mask(224, 32, cd >> 32 + 32 <= return_data.size
  require mem[mem[(32 * _14) + ceil32(return_data.size) + 128 len 4], Mask(224, 32, cd >> 32 + (32 * _14) + ceil32(return_data.size) + 128] <= 4294967296 and mem[(32 * _14) + ceil32(return_data.size) + 128 len 4], Mask(224, 32, cd >> 32 + (32 * mem[mem[(32 * _14) + ceil32(return_data.size) + 128 len 4], Mask(224, 32, cd >> 32 + (32 * _14) + ceil32(return_data.size) + 128]) + 32 <= return_data.size

def unknowne8f79006() payable: 
  require calldata.size - 4 >= 96
  require cd <= 4294967296
  require cd <= calldata.size
  require ('cd', 4).length <= 4294967296 and cd * ('cd', 4).length) + 36 <= calldata.size
  mem[0] = caller
  mem[32] = 4
  if bool(stor4[caller]) != 1:
      revert with 0, 'Who are you ?'
  mem[96] = 0xd06ca61f00000000000000000000000000000000000000000000000000000000
  mem[100] = cd[36]
  mem[132] = 64
  mem[164] = ('cd', 4).length
  mem[196 len 32 * ('cd', 4).length] = call.data[cd * ('cd', 4).length]
  mem[(32 * ('cd', 4).length) + 196] = 0
  require ext_code.size(unknown1694505eAddress)
  static call unknown1694505eAddress.0xd06ca61f with:
          gas gas_remaining wei
         args cdArray(len=('cd', 4).length, data=call.data[cd('cd', 4).length)])
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[96 len return_data.size] = ext_call.return_data[0 len return_data.size]
  mem[64] = ceil32(return_data.size) + 96
  require return_data.size >= 32
  _7 = mem[96 len 4], Mask(224, 32, cd >> 32
  require mem[96 len 4], Mask(224, 32, cd >> 32 <= 4294967296
  require mem[96 len 4], Mask(224, 32, cd >> 32 + 32 <= return_data.size
  require mem[mem[96 len 4], Mask(224, 32, cd >> 32 + 96] <= 4294967296 and mem[96 len 4], Mask(224, 32, cd >> 32 + (32 * mem[mem[96 len 4], Mask(224, 32, cd >> 32 + 96]) + 32 <= return_data.size
  mem[ceil32(return_data.size) + 96] = mem[mem[96 len 4], Mask(224, 32, cd >> 32 + 96]
  _10 = mem[_7 + 96]
  mem[ceil32(return_data.size) + 128 len floor32(mem[_7 + 96])] = mem[_7 + 128 len floor32(mem[_7 + 96])]
  require 1 < mem[ceil32(return_data.size) + 96]
  if mem[ceil32(return_data.size) + 160] < cd[68]:
      revert with 0, 'Opps'
  require 0 < ('cd', 4).length
  require ext_code.size(addr(('cd', 4)))
  static call addr(('cd', 4)).balanceOf(address owner) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(addr(('cd', 4)))
  call addr(('cd', 4)).approve(address spender, uint256 value) with:
       gas gas_remaining wei
      args unknown1694505eAddress, ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  mem[(32 * _10) + ceil32(return_data.size) + 128] = 0x38ed173900000000000000000000000000000000000000000000000000000000
  mem[(32 * _10) + ceil32(return_data.size) + 132] = cd[36]
  mem[(32 * _10) + ceil32(return_data.size) + 164] = cd[68]
  mem[(32 * _10) + ceil32(return_data.size) + 228] = this.address
  mem[(32 * _10) + ceil32(return_data.size) + 260] = block.timestamp
  mem[(32 * _10) + ceil32(return_data.size) + 196] = 160
  mem[(32 * _10) + ceil32(return_data.size) + 292] = ('cd', 4).length
  mem[(32 * _10) + ceil32(return_data.size) + 324 len 32 * ('cd', 4).length] = call.data[cd * ('cd', 4).length]
  mem[(32 * _10) + ceil32(return_data.size) + (32 * ('cd', 4).length) + 324] = 0
  require ext_code.size(unknown1694505eAddress)
  call unknown1694505eAddress.0x38ed1739 with:
       gas gas_remaining wei
      args cdArray(len=('cd', 4).length, data=call.data[cd('cd', 4).length)]), addr(this.address), block.timestamp
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  mem[(32 * _10) + ceil32(return_data.size) + 128 len return_data.size] = ext_call.return_data[0 len return_data.size]
  mem[64] = (32 * _10) + (2 * ceil32(return_data.size)) + 128
  require return_data.size >= 32
  require mem[(32 * _10) + ceil32(return_data.size) + 128 len 4], Mask(224, 32, cd >> 32 <= 4294967296
  require mem[(32 * _10) + ceil32(return_data.size) + 128 len 4], Mask(224, 32, cd >> 32 + 32 <= return_data.size
  require mem[mem[(32 * _10) + ceil32(return_data.size) + 128 len 4], Mask(224, 32, cd >> 32 + (32 * _10) + ceil32(return_data.size) + 128] <= 4294967296 and mem[(32 * _10) + ceil32(return_data.size) + 128 len 4], Mask(224, 32, cd >> 32 + (32 * mem[mem[(32 * _10) + ceil32(return_data.size) + 128 len 4], Mask(224, 32, cd >> 32 + (32 * _10) + ceil32(return_data.size) + 128]) + 32 <= return_data.size
  require 1 < ('cd', 4).length
  coins[addr(('cd', 4))] = block.number

