import 'dart:math';

typedef void EventCallback(arg);

class EventBus{

  //私有构造函数
  EventBus._internal();

  // 单例 Dart中实现单例模式的标准做法就是使用static变量+工厂构造函数
  static EventBus _singleton = new EventBus._internal();
  factory EventBus() => _singleton;

  var _emap = new Map<Object,List<EventCallback>>();

  //添加订阅者
  void on(eventName,EventCallback f){
    if(eventName == null || f == null) return;

    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(f);
  }

  //移除订阅者
  void off(eventName,[EventCallback f]){
    var list = _emap[eventName];
    if(eventName == null || list == null) return;
    if(f == null){
      _emap[eventName] = null;
    }else{
      list.remove(f);
    }
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName,[arg]){
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;

    for(var i=len;i>-1;--i){
      list[i](arg);
    }
  }
}

//定义一个top-level（全局）变量，页面引入该文件后可以直接使用bus
var bus = new EventBus();