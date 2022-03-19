pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;
import 'task.sol';
import 'task1.sol';
import 'task2.sol';
import 'task3.sol';

contract master{

    address[4] addressT;
    // address addressT1;
    // address addressT2;
    // address addressT3;

    
    function setAddressT(address[4] _addressT) external {
        addressT= _addressT;
    }

    string[4] status;
    uint256[4] time1;
    uint256[4] starttime1;
    uint256[4] diff;
    task.price expp;
    task1.price expp1;
    task2.price expp2;
    task3.price expp3;

    function callCheck() public view returns(uint256[4],string)
    {
        
        if(msg.sender== 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4)
        {
        task t= task(addressT[0]);
        (status[0], time1[0], starttime1[0], expp) = t.check();
        diff[0]=time1[0]-starttime1[0];

        task1 t1= task1(addressT[1]);
        (status[1], time1[1], starttime1[1], expp1) = t1.check();
        diff[1]= time1[1]- starttime1[1];

        task2 t2= task2(addressT[2]);
        (status[2], time1[2], starttime1[2], expp2) = t2.check();
        diff[2]= time1[2]-starttime1[2];

        task3 t3= task3(addressT[3]);
        (status[3], time1[3], starttime1[3], expp3) = t3.check();
        diff[3]= time1[3]-starttime1[3];
        }
        uint i=0;
        for(;i<4;i++)
        {
            if(keccak256(abi.encodePacked(status[i])) != keccak256(abi.encodePacked('Accepted')))
            {
                    break;
            }
        }
        if(i==4)
        {
            return (diff, "Proceed for payment");
        }
        return (diff, "Cancel");
    } 
    

    // function timecheck() external view returns(uint256, uint256)
    // {
    //     return (time1,starttime1);
    // }
}