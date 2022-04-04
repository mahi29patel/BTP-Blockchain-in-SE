pragma solidity 0.6.0;
pragma experimental ABIEncoderV2;


contract task{

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
      c1 = criteria(60,80, "40ece4500f7575f387e9e83e4a6c4ef9c9eb0a8988c819b4e50ad4755c6dbb7e",1, price(60, 70, 80, 90));
      starttime= now;
   }
  

criteria c2;
address dev;

function take_detail(uint8 _linecoverage, uint8 _branchcoverage, string memory _key,
   uint8 _cyclicDependency, price memory _p1) public
   {
       c2= criteria(_linecoverage, _branchcoverage, _key, _cyclicDependency, _p1);
       time= now;
       dev = msg.sender;
   }


    function check() public view returns (string memory, uint256, uint256, price memory, address) {

       if(dev != 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 && dev != 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db)
       {
        return ("You aren't allowed to check the conditions",time, starttime, c2.p1, msg.sender);
       }
       else
       {
        
       if(c2.linecoverage>=c1.linecoverage && c2.branchcoverage >=c1.branchcoverage && keccak256(abi.encodePacked(c2.key)) == keccak256(abi.encodePacked(c1.key)) && c2.cyclicDependency==c1.cyclicDependency)
       {
            return("Accepted",time,starttime, c2.p1,msg.sender);
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
        
        return(s, time, starttime, c2.p1, msg.sender);
           
       }

    }

    }

    }