import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
actor DBank{
  stable var currentValue:Float=300.00;
  stable var startTime=Time.now();
  //reset
  // startTime:=Time.now();
  // currentValue:=300.00;

  // Debug.print(debug_show(startTime));

  // currentValue:=200;
  let id=1000002384;
  // Debug.print(debug_show("Current Value: ",currentValue,id));
  
  public func topUp(amount:Float){
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };
  // public func topDown(amount:Float){
  //   if(currentValue>=amount){
  //     currentValue-=amount;
  //     Debug.print(debug_show(currentValue));
  //   }else{
  //     Debug.print(debug_show("You have no funds available to support this request"))
  //   }
  // };
  public func withdraw(amount:Float){
    let tempValue:Float=currentValue-amount;
    if(tempValue>=0){
      currentValue-=amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print(debug_show("You have no funds available to support this request"))
    }
  };

  public query func checkBalance():async Float{
      return currentValue;
  };

  public func compound(){
    let currentTime=Time.now();
    let elapsedTimeNS=currentTime-startTime;
    let elapsedTimeS:Float=Float.fromInt(elapsedTimeNS/1000000000);
    currentValue:=currentValue*(1.01**elapsedTimeS);
  };
}
