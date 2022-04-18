//Defining the solidity version
pragma solidity 0.6.0;
pragma experimental ABIEncoderV2;

//Defining the contract "task"
contract task{
 
 //Defining the struct price to store the cost of each task.
 /*The price model is divided into various factors:
    1. Software modification
    2. Web development
    3. Integration
    4. Resources */
    struct price
    {
        uint softwaremod;
        uint webdev;
        uint integration;
        uint resources;
    }

/*Defining the criteria of evaluation:
    1. linecoverage
    2. branchcoverage
    3. key: sha256 code of the JSON file containing test cases with expected outputs 
    4. cyclic dependency
    5. price: cost to accomplish the task */
    struct criteria{
        uint8 linecoverage;
        uint8 branchcoverage;
        string key;
        uint8 cyclicDependency;
        price p1;
    }

    // Declaring a structure object
    criteria c1;
    criteria c2;
    uint256 time;
    uint256 starttime;
    address dev;

    //To set the expected values of each criteria by the product owner
    function set_detail() public {
      c1 = criteria(60,80, "40ece4500f7575f387e9e83e4a6c4ef9c9eb0a8988c819b4e50ad4755c6dbb7e",1, price(60, 70, 80, 90));
      starttime= now;
    }
  
    /*To take/extract the values of each criteria from the code
    (here it is manually entered by the developer)*/
    function take_detail(uint8 _linecoverage, uint8 _branchcoverage, string memory _key,
        uint8 _cyclicDependency, price memory _p1) public
    {
       c2= criteria(_linecoverage, _branchcoverage, _key, _cyclicDependency, _p1);
       time= now;
       dev = msg.sender;
    }


    /*function check():
    Input: NIL
    Returns: Status of the task, start time, end time, cost of the task, developer's address
    Work: To check whether all criteria matches the expected critera
    */
    function check() public view returns (string memory, uint256, uint256, price memory, address) {

    // Only developer is allowed to check the code and other addresses aren't
       if(dev != 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 && dev != 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db)
       {
        return ("You aren't allowed to check the conditions",time, starttime, c2.p1, dev);
       }
       else
       {
        //If all the conditions match the task is accepted
       if(c2.linecoverage>=c1.linecoverage && c2.branchcoverage >=c1.branchcoverage && keccak256(abi.encodePacked(c2.key)) == keccak256(abi.encodePacked(c1.key)) && c2.cyclicDependency==c1.cyclicDependency)
       {
            return("Accepted",time,starttime, c2.p1,dev);
       }
       /*If some conditions doesn't match then the message is prompted 
       for the criteria to imporve upon*/
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
        
        return(s, time, starttime, c2.p1, dev);
           
       }

    }

    }

    }