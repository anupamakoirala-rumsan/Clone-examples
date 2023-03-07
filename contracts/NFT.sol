
pragma solidity 0.8.10;


import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is Initializable, ERC721Upgradeable, ERC721URIStorageUpgradeable{

   using Counters for Counters.Counter;

   Counters.Counter private tokenId;

   event NftMinted(uint256  indexed _tokenId, address indexed _reciever, address indexed _minter);

   event NftBurned(uint256 indexed _tokenId,address indexed _burnedBy);

   modifier onlyOwner(uint256 _tokenId){
      require(ownerOf(_tokenId) == msg.sender,"Nft:only owner");
      _;

   }
     
   function initialize(string memory name, string memory symbol) public initializer { 
        ERC721Upgradeable.__ERC721_init(name,symbol);
     }

   function mint(string calldata _tokenUri, address _to ) public {
      uint256 _id = tokenId.current();
      _safeMint(_to, _id);
      _setTokenURI(_id, _tokenUri);
      tokenId.increment();
      emit NftMinted(_id, _to, msg.sender);
     }

   function burn (uint256 _tokenId) public onlyOwner(_tokenId) {
      _burn(_tokenId);
      emit NftBurned(_tokenId, msg.sender);
   }

   function tokenURI(uint256 _tokenId) public view virtual override(ERC721Upgradeable,ERC721URIStorageUpgradeable) returns (string memory) {
       return super.tokenURI(_tokenId);
   }

   function _burn(uint256 _tokenId) internal override(ERC721Upgradeable,ERC721URIStorageUpgradeable){
      super._burn(_tokenId);
   }
}

