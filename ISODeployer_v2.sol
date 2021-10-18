pragma solidity >=0.7.0 <0.9.0;


contract ISODeployer {

    address owner;

    constructor() public {
        owner = msg.sender;
    }

    struct ISO {
        bytes32 name;
        uint256 creationDate;
        uint256 updateDate;
        uint8 numUpdates;
    }

    mapping (uint8 => uint8[]) private enterprises;
    mapping (bytes32 => ISO[]) private ISOS;
    
    
    function addNumber(uint8 enterprise, uint8 num) 
    public 
    {
        enterprises[enterprise].push(num);
    }
    
    
    function addISO(bytes32 enterprise, bytes32 ISOName, uint256 creationDate, uint256 updateDate) 
    public 
    {
        ISOS[enterprise].push(ISO(ISOName, creationDate, updateDate, 1));
    }
    
    
    function getNumber(uint8 enterprise) 
    public 
    returns(uint8[] memory)
    {
        return enterprises[enterprise];
    }
    
    function getISOsForEnterprise(bytes32 enterprise) 
    public 
    returns(ISO[] memory)
    {
        return ISOS[enterprise];
    }
    
    
    function getOwner() 
    public 
    returns(address)
    {
        return owner;
    }
    
}
