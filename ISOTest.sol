pragma solidity >=0.7.0 <0.9.0;


contract ISODeployer {

    address owner;

    constructor() public {
        owner = msg.sender;
    }

    struct ISO {
        uint256 creationDate;
        uint256 updateDate;
        uint8 numUpdates;
    }

    mapping (uint8 => uint8[]) private enterprises;
    
    
    function addISOssss(uint8 enterprise, uint8 num) 
    public 
    {
        enterprises[enterprise].push(num);
    }
    
    
    function getEnterpriseISOS(uint8 enterprise) 
    public 
    returns(uint8[] memory)
    {
        return enterprises[enterprise];
    }
    
}
