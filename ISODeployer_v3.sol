pragma solidity >=0.7.0 <0.9.0;


contract ISODeployer {

    address owner;

    constructor() public {
        owner = msg.sender;
    }

    struct ISO {
        string certificationId;
        string name;
        uint256 creationDate;
        uint256 validityDate;
        string fileHash;
        
    }

    mapping (string  => ISO[]) private ISOS;

    function addISO(string memory certificationId, string memory enterprise, string memory ISOName, uint256 creationDate, uint256 updateDate, string memory fileHash) 
    public
    {
        require(msg.sender == owner);
        ISOS[enterprise].push(ISO(certificationId, ISOName, creationDate, updateDate, fileHash));
    }
    
    function deleteISO(string memory certificationId, string memory enterprise) 
    public
    {
        require(msg.sender == owner);
        uint arrayLength = ISOS[enterprise].length;
        
        for (uint i=0; i<arrayLength; i++) {
          if (keccak256(bytes(ISOS[enterprise][i].certificationId)) == keccak256(bytes(certificationId))) {
            delete ISOS[enterprise][i];
            break;
          }
        }
    
    }
    
    function updateISOvalidity(string memory certificationId, string memory enterprise, uint256 validityDate) 
    public
    {
        require(msg.sender == owner);
        uint arrayLength = ISOS[enterprise].length;
        
        for (uint i=0; i<arrayLength; i++) {
          if (keccak256(bytes(ISOS[enterprise][i].certificationId)) == keccak256(bytes(certificationId))) {
            ISOS[enterprise][i].validityDate = validityDate;
            break;
          }
        }
    
    }
    
    function getISOsForEnterprise(string memory enterprise) 
    public 
    returns(ISO[] memory)
    {
        require(msg.sender == owner);
        return ISOS[enterprise];
    }
    
    
    function getOwner() 
    public 
    returns(address)
    {
        return owner;
    }
    
}
