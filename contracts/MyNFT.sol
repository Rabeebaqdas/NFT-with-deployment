// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
contract MyNFT is ERC721URIStorage, Ownable {

using Counters for Counters.Counter;
Counters.Counter private _tokenIds;

constructor () ERC721("Sigma Man","sm") {
}

function mintNFT(address recipient, string memory _tokenURI) public onlyOwner returns(uint) {
    _tokenIds.increment();
   uint256 newItemId = _tokenIds.current();
    _mint(recipient,newItemId);
     _setTokenURI(newItemId,_tokenURI);
     return newItemId;
}
}