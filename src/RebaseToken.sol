// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

 contract RebaseToken is ERC20{
    uint256 public s_interestRate= 5e10;
    mapping (address => uint) public _balances;
    event interestRate_set(uint256 interestrate);
    error RebaseToken_InterestRateDecrease(uint256 intialInterest, uint256 FinalInterest);

    constructor() ERC20("Rebase","RB"){
    
    }
     /*
     * @title RebaseToken
     * @dev A simple ERC20 token with a name, symbol, and 18 decimals.

     */
    /*
    * @notice Mint the user tokens when they deposit into the vault
    * @param _to The user to mint the tokens to
    * @param _amount The amount of tokens to mint

    */
   
     /*
     * @notice Calculate the interest that has accumulated since the last update
     * @param _user The user to calculate the balance for
     * @return The balance of the user including the interest that has accumulated in the time since the balance was last updated.

    */
    function setInterestRate( uint256 _newInterestRate) external{
        if(_newInterestRate < s_interestRate){
            revert RebaseToken_InterestRateDecrease(s_interestRate,_newInterestRate);
        }
        s_interestRate = _newInterestRate;
        emit interestRate_set(_newInterestRate);
    
   }
    function _mintaccuredInterest(address _user) internal view{

    }

     function balanceOf(address user) public view virtual returns (uint256) {
        return _balances[account];

}


 }
