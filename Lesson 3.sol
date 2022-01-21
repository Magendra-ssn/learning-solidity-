//SPDX-Liscense-Identifier: MIT

pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract fundme
{
    mapping(address => uint256) public addtoamt;
    address owner;
    address[] public funders;

    constructor() 
    public
    {
        owner = msg.sender;
    }


    function fund()
    public payable
    {
        uint256 min = 5000;
        require(msg.value >= 5, "You need to spend more !");
        addtoamt[msg.sender] += msg.value;
        funders.push(msg.sender);
        //ETH TO INR ?? - 

    }

    function getprice()
    public view returns (uint256)
    {
        AggregatorV3Interface agg = AggregatorV3Interface(0xB4a63294835b30AE58db8a21dd3BDBf8cF9B110b);
        (uint80 roundId,
         int256 answer,
         uint256 startedAt,
         uint256 updatedAt,
         uint80 answeredInRound)
         = agg.latestRoundData();
    
        return uint256(answer);

    }

    function conversion(uint256 ethamt) 
    public view returns(uint256)
    {
        uint256 ethprice = getprice();
        uint256 amt = (ethprice * ethamt);
        return amt;
    }

    modifier onlyowner
    {
        require(msg.sender == owner);
        _;
    }



    function widhraw() 
    public onlyowner payable
    {
        require(msg.sender == owner);
        msg.sender.transfer(address(this).balance);
        for (uint256 funderind=0; funderind < funders.length; funderind++)
        {
            address funder = funders[funderind];
            addtoamt[funder] = 0;
        }
        funders = new address[](0);
    }
}
