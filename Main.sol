// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable@4.7.3/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable@4.7.3/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable@4.7.3/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable@4.7.3/proxy/utils/UUPSUpgradeable.sol";

contract FinalToken is Initializable, ERC20Upgradeable, OwnableUpgradeable, UUPSUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() initializer public {
        __ERC20_init("Final Token", "FTK");
        __Ownable_init();
        __UUPSUpgradeable_init();

        _mint(msg.sender, 100 * 10 ** decimals());
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}
}
