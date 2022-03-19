pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;


contract task2{

    // enum Securitybug {critical, medium, light}

    struct price
    {
        uint softwaremod;
        uint webdev;
        uint integration;
        uint resources;
    }

    struct criteria{
        uint8 linecoverage;
        uint8 branchcoverage;
        string key;
        uint8 cyclicDependency;
        // Securitybug bug;
        price p1;

    }

     // Declaring a structure object
   criteria c1;
  uint256 time;
  uint256 starttime;
   function set_detail() public {
       //input
      c1 = criteria(120,30, "94b73256ba0bdca593fd63572bd4ef62ab9e7a79858568444fa8be4a77433fa0",0, price(80, 70, 80, 100));
      starttime= now;
   }
  

criteria c2;
address dev;

function take_detail(uint8 _linecoverage, uint8 _branchcoverage, string _key,
   uint8 _cyclicDependency, price _p1)
   {
       c2= criteria(_linecoverage, _branchcoverage, _key, _cyclicDependency, _p1);
       time= now;
       dev = msg.sender;
   }


    function check() public view returns (string, uint256, uint256, price) {

       if(dev != 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 && dev != 0x617F2E2fD72FD9D5503197092aC168c91465E7f2)
       {
        return ("You aren't allowed to check the conditions",time, starttime, c2.p1);
       }
       else
       {
        
       if(c2.linecoverage>=c1.linecoverage && c2.branchcoverage >=c1.branchcoverage && keccak256(abi.encodePacked(c2.key)) == keccak256(abi.encodePacked(c1.key)) && c2.cyclicDependency==c1.cyclicDependency)
       {
            return("Accepted",time,starttime, c2.p1);
       }
       else
       {
           bytes memory b;
           b= abi.encodePacked("You need to improve on: \n");
           if(c2.linecoverage<c1.linecoverage)
           {
               b= abi.encodePacked(b, "Increase the line coverage , ");
           }
           if(c2.branchcoverage< c1.branchcoverage)
           {
               b= abi.encodePacked(b, "Increase the branch coverage , " );
           }
           if(keccak256(abi.encodePacked(c2.key)) != keccak256(abi.encodePacked(c1.key)))
           {
               b= abi.encodePacked(b, "Unit test cases doesn't pass , ");
           }
           if(c2.cyclicDependency != c1.cyclicDependency)
           {
               b= abi.encodePacked(b, "Improve cyclic dependency");
           }
           string memory s= string(b);
        
        return(s, time, starttime, c2.p1);
           
       }

    }

    }

    }