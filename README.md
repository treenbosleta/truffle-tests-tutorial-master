# CM_T

这个仓库主要用来我个人记录 测试智能合约 相关的内容，本篇主要是智能合约测试理论以及truffle测试示例，另一篇hardhat测试示例在https://github.com/treenbosleta/CM_T_hardhat

对Uniswap的代码的认识和以及测试相关的内容
https://github.com/treenbosleta/CM_T_U




目录：

     一、   测试智能合约的意义

     二、   测试智能合约的方式

     三、   测试智能合约的范围
     
     四、   测试会用到的一些工具truffle、mocha、hardhat、brownie、js、solidity、ether.js/web3.js  etherscan metamask 等等
     
     五、   项目实操
     
   



一、为什么需要测试智能合约？
    1、  智能合约在Defi领域有大量的应用，智能合约上的漏洞会导致大量金融资产的流失，也会给项目方以及用户带来其他严重的损失。
    2、  智能合约是不可变的，一旦部署就很难再更改，虽然也有类似代理合约的升级机制，但其运行起来的成本和其他代价.
   
   
   
二、智能合约的测试方式主要分手工测试和自动化测试，这一点与web2测试基本一致

    1、  自动化测试：
        1. 使用mocha框架进行测试
        1. 使用truffle套件（也是基于mocha框架）进行测试， 在truffle使用solidity和JavaScript编写测试代码进行测试
    
    2、  手工测试：
        1. 代码走读，寻找逻辑缺陷
        2. 模拟用户场景手动遍历功能
        
        
三、智能合约测试的范围

        1、单元测试
                1.检查函数返回值
                2.检查状态变量
                
        2、集成测试
                1.检查合约间的交互
                2.检查前端以及其他信息调用
                
        3、系统测试
                1.从用户角度遍历核心功能的整个过程
                2.关注用户体验
        
        
 四、智能合约测试会用到的一些工具
 
     1、  truffle套件（也是基于mocha框架）
          
          测试用的会比较多的框架，使用js和solidity写自动化代码都比较方便，其测试框架还是基于mocha的，但更加便利，一般也会和ganache一起搭配使用
     
     2、  mocha框架
          
          很强大的一个测试框架，主要使用JavaScript来编写测试用例，其报告相对友好一些
          
     3、  hardhat
     
          部署和调试十分方便，跟truffle是类似的产品
     
     4、  js
          truffle和hardhat都会用到这个语言来写自动化用例，通用型语言，跟部分研发语言保持一致，基本用的比较多的ether.js/web3.js
     
     5、  solidity
          智能合约主流语言，truffle里测试合约交互比较方便
     
     6、  Brownie
          python语言，框架跟pytest很像，目前相对上面两个相对小众
       
     7、  etherscan
          区块链浏览器，一般会去看下合约生成情况以及其他信息
          
     8、  metamask
          小狐狸钱包，这个基本在web3里面都会用到，用户身份许可也从这里获得，  mes.sender 调用方大多是metamask的登陆者
  
        
        
五、智能合约测试结合项目的实际操作

        分析测试需求以及一些其他测试准备工作，此处省略......
        
        1、部署测试环境
        2、部署待测示例项目
        3、编写自动化测试用例代码
        4、自动化代码评审
        5、执行自动化测试
        6、智能合约测试报告的输出
        
        
        由于一个项目测试展开会过长，此处考虑极简方式说明
        
        
        
主要说下在truffle套件里使用solidity和JavaScript写测试脚本吧

  
        先看下面两个合约
        
![image](https://github.com/treenbosleta/CM_T/blob/109a18f52421515fb08b6c58ba578accbfe97b9b/WechatIMG141.png)

     三个函数， 推一个值到列表、通过下标获取值、获取列表长度
     
     
 ![image](https://github.com/treenbosleta/CM_T/blob/e10acbcaef838ee4a77636adeb2b990de5c16ca6/WechatIMG142.png)
 
     给定一个地址，通过另一个只读函数返回他，然后调用上一个合约的功能给这个地址授予包含两个值的列表，并输出这个列表的长度
     
     
     以上是合约内容以及基础的功能
     
     
     
先说下solidity单元测试部分
     
     
 ![image](https://github.com/treenbosleta/CM_T/blob/0e5f958dbeed13be6b9c9f40c3ec45058a83eb18/WechatIMG143.png)
 
     这个是对第一个合约的单元测试合约，实例化后通过断言的方式判断设定值和get到的值是否相等，长度断言也一样，最后是通过遍历表中所有值是否与设定值相等
     这里的beforeEach（）函数可以理解为 pytest 里面的fixture下 setup（）函数，以及配对的teardown（），主要用来做测试前条件准备与测试后清场恢复作用
     
     
     
![image](https://github.com/treenbosleta/CM_T/blob/e55c8c86dd7bef201fb94472688c1ed2f8701ca8/WechatIMG144.png)
     
     对第二个合约的单元测试合约，基本没什么说的，基本都是在调用合约1进行验证
     
     
     
然后是solidity集成测试部分

![](https://github.com/treenbosleta/CM_T/blob/29d9131ffbc2aa1fe1a57bc5a8545c653c283bcd/WechatIMG145.png)

     集成测试主要测试的是两个或多个合约的交互是否通畅，有些数据需要mock来模拟外部传入的一些参数
     
    
        
        
![image](https://github.com/treenbosleta/CM_T/blob/29d9131ffbc2aa1fe1a57bc5a8545c653c283bcd/WechatIMG140.png)
        关于导入truffle/Assert.sol 报错的问题，  VScode编辑器的问题，实际可以引用，但如果注销了，asser又会报错......
        
        
        
        
 下面是使用JavaScript来验证前端调用合约是否正常的测试用例代码
     
 ![image](https://github.com/treenbosleta/CM_T/blob/f5777560e09e440bb05453081d4ab9066bcf4741/WechatIMG146.png)
 
     这里分为mocha写法和truffle写法，其实基本都差不多
     我这里用mocha演示， 标志就是 describe  should.be 
     
     引入要测试的合约，it后面的字符串这里可以描述一下测试预期，然后异步等待部署完成调用初始列表以及推入值之后的列表是否正确
     
     
     
     
     
     以上就是简单的单元测试、集成测试（solidity、JavaScript）思路以及具体示例，工作中完整的用例会根据实际的项目/业务来展开。
     
     
     
     
     
     上面流程上的东西很多没有展开，之后有时间再慢慢展开
     
 
        
        
        
        
        
        
        
        
        
