pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;
import 'master.sol';


contract stakeholder
{

   address addressM;

    
    function addMasterAdd(address _addressM) external {
        addressM= _addressM;
    }

   

   uint256[4] diff2;
   string status2;
   int[4] penalty2;

   

    function payEther() public payable 
    {

    }
    function getBalance() public view returns(uint)
    {
        return address(this).balance;
    }
    int flag;

    function sendEtherAccount() public payable
    {
        address payable vendor = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
       
        master m= master(addressM);
        (diff2, status2, penalty2,flag) = m.callCheck();
       
        if(flag == 1)
            {
                    vendor.transfer(1 ether);
            }
            else
            {
                vendor.transfer(0 ether);
            }
    }



}