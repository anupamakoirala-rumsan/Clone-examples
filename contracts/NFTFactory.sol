
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

pragma solidity 0.8.10;

contract NFTFactory is ERC721{

    constructor (string memory name, string memory symbol) ERC721(name,symbol){}
}