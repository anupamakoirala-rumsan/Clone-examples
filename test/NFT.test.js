const NFTFactory = artifacts.require("NFTFactory");
const NFT = artifacts.require("NFT");


contract("NFT", ()=>{
    let nftFactory;
    let nft;
    before(async()=>{
        [deployer,addr1,addr2,addr3] = await web3.eth.getAccounts();
        nftFactory = await NFTFactory.new();
    
    });
    
    describe("NFTFactory",function(){
        it("Should deploy NFTFactory", async()=>{
            assert(nftFactory.address != "");

        });
        
    })
    describe("NFT", function(){
        it("Should deploy new NFT contract as a proxy contract", async ()=>{
            await nftFactory.createNft("TestArt","TART");
           const nftaddress = await nftFactory.getNfts();
           assert.equal(nftaddress.length,1);

        })
    })

    describe("NFT Deploy", function(){
        it("Should deploy NFt", async ()=>{
            nft = await NFT.new("Art","ART");
            assert(nft.address != "");
        })
    })
})