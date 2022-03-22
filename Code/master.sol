pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;
import 'task.sol';
import 'task1.sol';
import 'task2.sol';
import 'task3.sol';

contract master{

    address[4] addressT;

    
    function setAddressT(address[4] _addressT) external {
        addressT= _addressT;
    }

    uint256[4] exptime=[12, 10, 8, 6];
    uint256[4] excp= [60, 80, 70, 80];
    uint256[4] excp1= [60, 80, 70, 80];
    uint256[4] excp2= [60, 80, 70, 80];
    uint256[4] excp3= [60, 80, 70, 80];

    string[4] public status;
    int[4] penalty1;
    uint256[4] time1;
    uint256[4] starttime1;
    uint256[4] diff;
    address sender;
    // mapping(address => uint) public penalty;
    task.price expp;
    task1.price expp1;
    task2.price expp2;
    task3.price expp3;

    // function returnMappingValue(address _key) public view returns (uint) {
    //     return penalty[_key];
    // }  

    // //compare function of time and price to calculate the penalty points
    // function compare(uint256 _time1, uint256 _starttime1, uint i, address sender) public view
    // {
    //     diff[i]=(_time1-_starttime1)/3600;
    //         if(exptime[i]-diff[i] < 0)
    //         {
    //             penalty[sender]++;
    //         }
      
    // }

    function callCheck() public view returns(uint256[4],string, int[4])
    {
        
        if(msg.sender== 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4)
        {
        task t= task(addressT[0]);
        (status[0], time1[0], starttime1[0], expp, sender) = t.check();
        // compare(time1[0],starttime1[0],0, sender);
        
        diff[0]=(time1[0]-starttime1[0]);

    /******** time comparison *********/
      if(int(exptime[0])-int(diff[0]) < 0)
      {
          penalty1[0]++;

      }
      /*****************************************/
      /******** price comparison *********/
         if(int(expp.softwaremod)-int(excp[0]) < 0)
      {
          penalty1[0]++;
      } 
       if(int(expp.webdev)-int(excp[1]) < 0)
      {
          penalty1[0]++;
      } 
       if(int(expp.integration)-int(excp[2]) < 0)
      {
          penalty1[0]++;
      } 
        if(int(expp.resources)-int(excp[3]) < 0)
      {
          penalty1[0]++;
      } 
      /**************************************************/

      

        task1 t1= task1(addressT[1]);
        (status[1], time1[1], starttime1[1], expp1, sender) = t1.check();
        diff[1]=(time1[1]-starttime1[1]);

        if(int(exptime[1])-int(diff[1]) < 0)
            {
                penalty1[1]++;
            }

        /******** price comparison *********/
         if(int(expp1.softwaremod)-int(excp1[0]) < 0)
      {
          penalty1[1]++;
      } 
       if(int(expp1.webdev)-int(excp1[1]) < 0)
      {
          penalty1[1]++;
      } 
       if(int(expp1.integration)-int(excp1[2]) < 0)
      {
          penalty1[1]++;
      } 
        if(int(expp1.resources)-int(excp1[3]) < 0)
      {
          penalty1[1]++;
      } 
      /**************************************************/
       

        task2 t2= task2(addressT[2]);
        (status[2], time1[2], starttime1[2], expp2, sender) = t2.check();
        diff[2]=(time1[2]-starttime1[2]);
        
        if(int(exptime[2])-int(diff[2]) < 0)
            {
                penalty1[2]++;
            }
         /******** price comparison *********/
         if(int(expp2.softwaremod)-int(excp2[0]) < 0)
      {
          penalty1[2]++;
      } 
       if(int(expp2.webdev)-int(excp2[1]) < 0)
      {
          penalty1[2]++;
      } 
       if(int(expp2.integration)-int(excp2[2]) < 0)
      {
          penalty1[2]++;
      } 
        if(int(expp2.resources)-int(excp2[3]) < 0)
      {
          penalty1[2]++;
      } 
      /**************************************************/   
        

        task3 t3= task3(addressT[3]);
        (status[3], time1[3], starttime1[3], expp3, sender) = t3.check();
        diff[3]=(time1[3]-starttime1[3]);
       
        if(int(exptime[3])-int(diff[3])< 0)
            {
                penalty1[3]++;
            }

         /******** price comparison *********/
         if(int(expp3.softwaremod)-int(excp3[0]) < 0)
      {
          penalty1[3]++;
      } 
       if(int(expp3.webdev)-int(excp3[1]) < 0)
      {
          penalty1[3]++;
      } 
       if(int(expp3.integration)-int(excp3[2]) < 0)
      {
          penalty1[3]++;
      } 
        if(int(expp3.resources)-int(excp3[3]) < 0)
      {
          penalty1[3]++;
      } 
      /**************************************************/  
     
         

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
            return (diff, "Proceed for payment",penalty1);
        }
        return (diff, "Cancel",penalty1);
    } 
    

 
}