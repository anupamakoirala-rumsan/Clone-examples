
pragma solidity 0.8.10;


import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";

contract NFT is Initializable, ERC721Upgradeable{
     
     function initialize(string memory name, string memory symbol) public initializer { 
        ERC721Upgradeable.__ERC721_init(name,symbol);
     }
}

