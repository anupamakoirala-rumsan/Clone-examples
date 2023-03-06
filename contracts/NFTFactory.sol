
import "@openzeppelin/contracts/proxy/Clones.sol";
import "./NFT.sol";
// import "@openzeppelin/contracts-upgradeable/contracts/token/ERC721/ERC721Upgradeable.sol";


pragma solidity 0.8.10;

contract NFTFactory {

    address immutable public implementationContract;

    constructor(){
        implementationContract = address (new  NFT());
    }

    function createNft(string memory name , string memory symbol) public returns (address   nftContract) {
        address clone = Clones.clone(implementationContract);
        NFT(clone).initialize(name, symbol);
        return clone;
    }


    // constructor (string memory name, string memory symbol) ERC721(name,symbol){}
}