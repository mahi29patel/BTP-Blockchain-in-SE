//Defining the solidity version
pragma solidity 0.6.0;
pragma experimental ABIEncoderV2;
import 'master.sol';

//Defining the contract "stakeholder"
contract stakeholder
{
    struct date1
    {
        uint days1;
        uint month1;
        uint year1;
    }

    address addressM;

    //To count the leap years
    function countleapyears(date1 memory _d2) public returns(uint)
    {
        uint years2= _d2.year1;
       
        if( _d2.month1 <=2)
            {
                years2--;
            }

        return (years2/4) - (years2/100) + (years2/400);
    }
    

    uint exptime2;

    //To calculate number of days delayed between expected date and sprint end date
    function timestamp1(date1 memory _d1) public returns(uint)
    {   
        date1 memory _maind;
        _maind.days1= 1;
        _maind.month1=1;
        _maind.year1=1970;

        uint8[12] memory monthdays = [31,28,31,30,31,30,31,31,30,31,30,31];
        uint256 n1= _maind.year1 * 365 + _maind.days1;

        for (uint i = 0; i < _maind.month1 - 1; i++)
        {
		    n1= n1+ monthdays[i];
        }

        n1= n1+ countleapyears(_maind);

        uint256 n2= _d1.year1 * 365 + _d1.days1;

        for (uint i = 0; i < _d1.month1 - 1; i++)
        {
		   n2= n2+ monthdays[i];
        }
        
        n2= n2+ countleapyears(_d1);

	    exptime2= ((n2 - n1)*86400) - 19800;
        return exptime2;

    }


    //To set master contract's address
    function addMasterAdd(address _addressM) external {
        addressM= _addressM;
    }

    uint256 time2;
    string status2;
    int[4] penalty2;

    //Pay ethers from stakeholder's address to the deployed contract
    function payEther() public payable 
    {

    }

    //To view the balance 
    function getBalance() public view returns(uint)
    {
        return address(this).balance;
    }

    int flag;

    /*function sendEtherAccount():
    Input: NIL
    Output: Timestamp
    Work: Send ethers to product owner's address */
    function sendEtherAccount() public payable returns(uint)
    {
        //vendor's address
        address payable vendor = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
       
        master m= master(addressM);
        (time2, status2,flag) = m.callCheck();

        //delayed days to complete the sprint
        int extra= (int(time2)-int(exptime2))/86400;

        //if all tasks are accepted
        if(flag == 1)
            {
                //if the task is delayed
                if(extra>0)
                    {
                        vendor.transfer(1 ether - 0.01 ether*uint(extra));
                    }

                else
                    {
                        vendor.transfer(1 ether);
                    }      
            }

        else
            {
                vendor.transfer(0 ether); 
            }

            return time2;
    }

}