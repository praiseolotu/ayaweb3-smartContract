// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;
contract EtherContract {

 address payable public owner;
 uint balance_amount;

 //the constructor
  constructor ()  public
    {
            owner = payable(msg.sender);
            balance_amount = 0;
    }



function deposit() external payable {
        require(msg.value>0,"The Amount must be greater than 0");
         balance_amount += msg.value;
    }


function withdraw(address payable  destination,uint256 amount) public payable isOnlyOwner{
     require(amount <  balance_amount ,"Insufficient amount!!");
    require(amount >0,"Amount must be greter than 0");

        destination.transfer(amount);
         balance_amount -= amount;
    }


receive() external payable {
    balance_amount +=msg.value;

}

function getTotalBalance() public view returns(uint)
{
    return address(this).balance;
}


function getBalance() public view returns(uint)
{
   return   balance_amount;
}
}
