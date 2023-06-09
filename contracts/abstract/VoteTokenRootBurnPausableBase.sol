pragma ton-solidity >= 0.57.0;

pragma AbiHeader expire;
pragma AbiHeader pubkey;

import "./VoteTokenRootBase.tsol";
import "tip3/contracts/interfaces/IBurnPausableTokenRoot.sol";
import "tip3/contracts/libraries/TokenMsgFlag.sol";


abstract contract VoteTokenRootBurnPausableBase is VoteTokenRootBase, IBurnPausableTokenRoot {

    bool burnPaused_;

    function burnPaused() override external view responsible returns (bool) {
        return { value: 0, flag: TokenMsgFlag.REMAINING_GAS, bounce: false } burnPaused_;
    }

    function setBurnPaused(bool paused) override external responsible onlyRootOwner returns (bool) {
        burnPaused_ = paused;
        return { value: 0, flag: TokenMsgFlag.REMAINING_GAS, bounce: false } burnPaused_;
    }

    function _burnEnabled() override internal view returns (bool) {
        return !burnPaused_;
    }

}
