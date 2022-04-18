//Defining the solidity version
pragma solidity 0.6.0;
pragma experimental ABIEncoderV2;
//Importing all the task contract
import 'task.sol';
import 'task1.sol';
import 'task2.sol';
import 'task3.sol';

//Defining the contract "master"
contract master{

    address[4] addressT;

    //To store the addresses of the deployed task contracts
    function setAddressT(address[4] calldata _addressT) external {
        addressT= _addressT;
    }

    //Expected time required to complete each task
    uint256[4] exptime=[12, 10, 8, 6];

    //Expected cost required for each task
    uint256[4] excp= [60, 80, 70, 80];  //Task1
    uint256[4] excp1= [60, 80, 70, 80]; //Task2
    uint256[4] excp2= [60, 80, 70, 80]; //Task3
    uint256[4] excp3= [60, 80, 70, 80]; //Task4

    string[4] status;
    uint256[4] time1;
    uint256[4] starttime1;
    uint256[4] diff;
    address send1;
    //Map to store penalty in the developer addresses
    mapping(address => uint) public penalty;
    task.price expp;
    task1.price expp1;
    task2.price expp2;
    task3.price expp3;
    uint sprinttime;
   
    /*function callCheck():
    Input: NIL
    Output:Sprint completion time, status to proceed for payment,flag
    Work: To check the penalty of the developer if price or time taken is higher,
          to see if all tasks are successfully completed and to prompt stakeholder
          for the payment. */

    function callCheck() external returns(uint256,string memory, int)
    {
        //Checks that only product owner is executing the function
        if(msg.sender== 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4)
        {
            /*************** TASK1 *****************/
            task t= task(addressT[0]);
            (status[0], time1[0], starttime1[0], expp, send1) = t.check();
            diff[0]=(time1[0]-starttime1[0]);

            //Time penalty
            if(int(exptime[0])-int(diff[0]) < 0)
                {
                    penalty[send1]++;
                }

            //Cost penalty
            if(int(expp.softwaremod)-int(excp[0]) < 0)
                {
                    penalty[send1]++;
                } 
            if(int(expp.webdev)-int(excp[1]) < 0)
                {
                    penalty[send1]++;
                } 
            if(int(expp.integration)-int(excp[2]) < 0)
                {
                    penalty[send1]++;
                } 
            if(int(expp.resources)-int(excp[3]) < 0)
                {
                    penalty[send1]++;
                } 
      
      
            /*************** TASK2 *****************/
            task1 t1= task1(addressT[1]);
            (status[1], time1[1], starttime1[1], expp1, send1) = t1.check();
            diff[1]=(time1[1]-starttime1[1]);

            //Time penalty
            if(int(exptime[1])-int(diff[1]) < 0)
                {
                    penalty[send1]++;
                }

            //Cost penalty
            if(int(expp1.softwaremod)-int(excp1[0]) < 0)
                {
                    penalty[send1]++;
                } 
            if(int(expp1.webdev)-int(excp1[1]) < 0)
                {
                    penalty[send1]++;
                } 
            if(int(expp1.integration)-int(excp1[2]) < 0)
                {
                    penalty[send1]++;
                } 
            if(int(expp1.resources)-int(excp1[3]) < 0)
                {
                    penalty[send1]++;
                } 
            

            /*************** TASK3 *****************/
            task2 t2= task2(addressT[2]);
            (status[2], time1[2], starttime1[2], expp2, send1) = t2.check();
            diff[2]=(time1[2]-starttime1[2]);
        
            //Time penalty
            if(int(exptime[2])-int(diff[2]) < 0)
                {
                    penalty[send1]++;
                }

            //Cost penalty
            if(int(expp2.softwaremod)-int(excp2[0]) < 0)
                {
                    penalty[send1]++;
                } 
            if(int(expp2.webdev)-int(excp2[1]) < 0)
                {
                    penalty[send1]++;
                } 
            if(int(expp2.integration)-int(excp2[2]) < 0)
                {
                    penalty[send1]++;
                } 
            if(int(expp2.resources)-int(excp2[3]) < 0)
                {
                    penalty[send1]++;
                } 
        
        
            /*************** TASK4 *****************/
            task3 t3= task3(addressT[3]);
            (status[3], time1[3], starttime1[3], expp3, send1) = t3.check();
            diff[3]=(time1[3]-starttime1[3]);
       
            //Time penalty
            if(int(exptime[3])-int(diff[3])< 0)
                {
                    penalty[send1]++;
                }

         
            if(int(expp3.softwaremod)-int(excp3[0]) < 0)
                {
                    penalty[send1]++;
                } 
            if(int(expp3.webdev)-int(excp3[1]) < 0)
                {
                    penalty[send1]++;
                } 
            if(int(expp3.integration)-int(excp3[2]) < 0)
                {
                    penalty[send1]++;
                } 
            if(int(expp3.resources)-int(excp3[3]) < 0)
                {
                    penalty[send1]++;
                }  

            sprinttime= now;
        }

        uint i=0;

        //To check whether all tasks are accepted
        for(;i<4;i++)
        {
            if(keccak256(abi.encodePacked(status[i])) != keccak256(abi.encodePacked('Accepted')))
            {
                    break;
            }
        }
        if(i==4)
        {
            
            return (sprinttime, "Proceed for payment",1);
        }

        return (sprinttime, "Cancel",-1);
    } 
    

 
}