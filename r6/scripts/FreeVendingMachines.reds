// FreeVendingMachines, Cyberpunk 2077 mod that gives you the ability to get items from vending machines for free
// Copyright (C) 2022 BurgersMcFly

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

@replaceMethod(DispenceItemFromVendor)

  public final func SetProperties(iteID: ItemID, opt price: Int32, opt texture: CName) -> Void {
    this.actionName = n"DispenceItem";
    this.prop = DeviceActionPropertyFunctions.SetUpProperty_Bool(n"Dispence Item", true, n"LocKey#17849", n"LocKey#17849");
    this.m_itemID = iteID;
    this.m_price = 0;
    this.m_atlasTexture = texture;
  }

@replaceMethod(VendingMachine)

  protected func CreateDispenseRequest(shouldPay: Bool, item: ItemID) -> ref<DispenseRequest> {
    let dispenseRequest: ref<DispenseRequest> = new DispenseRequest();
    dispenseRequest.owner = this;
    dispenseRequest.position = this.RandomizePosition();
    dispenseRequest.shouldPay = false;
    if ItemID.IsValid(item) {
      dispenseRequest.itemID = item;
    };
    return dispenseRequest;
  }

@replaceMethod(WeaponVendingMachine)

  protected func CreateDispenseRequest(shouldPay: Bool, item: ItemID) -> ref<DispenseRequest> {
    let dispenseRequest: ref<DispenseRequest> = new DispenseRequest();
    dispenseRequest.owner = this;
    dispenseRequest.position = this.RandomizePosition();
    dispenseRequest.shouldPay = false;
    if ItemID.IsValid(item) {
      dispenseRequest.itemID = ItemID.CreateQuery(ItemID.GetTDBID(item));
    };
    return dispenseRequest;
  }