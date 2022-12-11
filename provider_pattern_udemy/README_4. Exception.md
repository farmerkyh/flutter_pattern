<img src="./README_images/adfasdf.png">

# 1. Exception 정의
### 1. 강의
 - https:/www.udemy.com/ > Flutter Provider Essential 코스 (Korean)  
 - 28. Chapter 28. Errors & addPostFrameCallback 1

### 2. Exception
The following ProviderNotFoundException was thrown building MyHomePage(dirty):
Error: Could not find the correct Provider<Foo> above this MyHomePage Widget
This happens because you used a `BuildContext` that does not include the provider of your choice. There are a few

 2. 3가지 시나리오
- You added a new provider in your `main.dart` and performed a hot-reload.
To fix, perform a hot-restart.
- The provider you are trying to read is in a different route.
Providers are "scoped". So if you insert of provider inside a route, then
other routes will not be able to access that provider.
- You used a `BuildContext` that is an ancestor of the provider you are trying to read.
Make sure that MyHomePage is under your MultiProvider/Provider<Foo>.
This usually happens when you are creating a provider and trying to read it immediately. 

