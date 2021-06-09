---
title: "What is a Linked-List"
preview: "The concept of a linked list"
date: "2021-06-08"
author: "jaekpark"
previous: "Libft4"
next: "Netwhat"
coverUrl: "https://t1.daumcdn.net/cfile/tistory/99CEE2425CB7F7CB10"
---

# Linked List

+ **연결 리스트, 링크드 리스트**는 각 `Node`가 **데이터**와 **포인터**를 가지고 한 줄로 연결 되어 있는 방식의 데이터 저장 **자료구조**이다.
+ 데이터를 담고 있는 `Node`의 포인터가 다음이나 이전의 노드와 연결되어 있다.
+ **연결 리스트**의 종류에는 `단일 연결 리스트`, `이중 연결 리스트`, `원형 연결 리스트`가 있다.
---
1. **단일 연결 리스트**
	+ 단일 연결 리스트는 각 노드에 대한 자료 공간과 한 개의 포인터 공간이 있고, 각 노드의 포인터는 **다음 노드**를 가리킨다.
	![단일 연결 리스트의 구조](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Single_linked_list.png/800px-Single_linked_list.png)
2. **이중 연결 리스트**
	+ 이중 연결 리스트는 포인터 공간이 두개가 있고 각 포인터는 **앞의 노드**와 **뒤의 노드**를 가리킨다.
	![enter image description here](https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Doubly_linked_list.png/800px-Doubly_linked_list.png)
3. **원형 연결 리스트**
	+ 원형 연결 리스트는 단일 연결 리스트에 마지막 노드와 처음 노드를 연결 시켜 원형으로 만든 구조의 리스트다.
	![enter image description here](https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Circurlar_linked_list.png/800px-Circurlar_linked_list.png)

> 출처 : wiki(https://ko.wikipedia.org/wiki/%EC%97%B0%EA%B2%B0_%EB%A6%AC%EC%8A%A4%ED%8A%B8)


## ft_lst~
* **Synopsis**
```c
typedef struct				s_list
{
	void					*content;
	typedef struct s_list	*next;
}							t_list;
```
* `content` : 리스트에 담을 값
* `next` : 다음번 리스트에 대한 주소

## ft_lstnew
* **Synopsis**
```c
t_list ft_lstnew(void *content)
{
	t_list *new;

	if(!(new = malloc(sizeof(t_list))))
		return (NULL);
	new->content = content;
	new->next = NULL;
	return (new);
}
```
* **Description**
	+ 리스트 생성 함수
	+ 새로운 리스트를 생성하고 멤버 변수에 값을 할당한다.
* **Parameter**
	+ `content` : 생성된 리스트의 멤버 변수에 할당할 값
* **Return Value**
	+ 생성된 리스트의 주소를 반환한다.

## ft_lstadd_front
* **Synopsis**
```c
void ft_lstadd_front(t_list **lst, t_list *new)
{
	if (lst && new)
	{
		new->next = *lst;
		*lst = new;
	}
	else
		return ;
]
```
* **Description**
	+ 리스트의 맨 앞 단에 새로운 리스트를 추가하는 함수
* **Paramter**
	+ `lst` : 새로운 리스트를 추가하고자 하는 대상 연결 리스트 주소
	+ `new` : 새로 추가하고자 하는 리스트 주소
```c
void ft_lstadd_front(t_list **lst, t_list *new)
{
	t_list **curr;

	curr = lst;
	if (curr && new)
	{
		new->next = curr;
		curr = new;
	}
	else
		return ;
}
```

## ft_lstsize
* **Synopsis**
```c
int ft_lstsize(t_list *lst)
{
	int size;
	
	size = 0;
	while (lst)
	{
		lst = lst->next;
		size++;
	}
	return (size);
}
```
* **Description**
	+ 연결된 리스트의 개수를 구하는 함수
* **Parameter**
	+ `lst` : 개수를 구할 대상 연결 리스트의 가장 처음 노드 주소
* **Return Value**
	+ 연결 된 리스트의 개수 반환

## ft_lstlast
* **Synopsis**
```c
t_list *ft_lstlast(t_list *lst)
{
	if(!lst)
		return (NULL);
	while (lst ->next)
		lst = lst->next;
	return (lst);
}
```
* **Description**
	+ 연결 리스트의 가장 마지막 노드를 찾는 함수
* **Paramter**
	+ `lst` : 마지막 노드를 찾을 리스트 주소
* **Return Value**
	* 마지막 노드 주소를 반환

## ft_lstadd_back
* **Synopsis**
```c
void ft_lstadd_back(t_list **lst, t_list *new)
{
	t_list *last;
	
	if (!lst || !new)
		return ;
	if (!*lst)
	{
		*lst = new;
		return ;
	}
	last = ft_lstlast(*lst);
	last->next = new;
}
```
* **Description**
	+ 연결 리스트의 맨 뒤에 새로운 노드를 추가하는 함수
* **Parameter**
	+ `lst` :  노드 추가의 대상이 되는 리스트의 주소
	+ `new` : 추가 할 새로운 노드

## ft_lstdelone
* **Synopsis**
```c
void ft_lstdelone(t_list *lst, void (*del)(void *))
{
	if (!lst || !del)
		return ;
	del(lst->content);
	return (lst);
}
```

## ft_lisiter
* **Synopsis**
```c
void ft_lstiter(t_list *lst, void (*f)(void *))
{
	if (!lst || !f)
		return ;
	while (lst)
	{
		f(lst->content);
		lst = lst->next;
	}
}
```
* **Description**
	+ 리스트의 멤버 변수에 특정 함수를 적용 시키는 함수
* **Paramter**
	+ `lst` : 함수 적용의 대상이 되는 리스트
	+ `(*f)(void *)` : 적용할 함수

## ft_lstmap
* **Synopsis**
```c
t_list *ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	*new_lst;
	t_list	*new_node;

	if (!lst || !f)
		return (NULL);
	new_lst = NULL;
	while (lst)
	{
		if (!(new_node = ft_lstnew(f(lst->content))))
		{
			ft_lstclear(&new_node, del);
			break ;
		}
		ft_lstadd_back(&new_lst, new_node);
		lst = lst->next;
	}
	return (new_lst);
}
```
* **Description**
	* 연결 리스트의 멤버 변수에 특정 함수를 적용한 새로운 리스트를 생성하는 함수
* **Paramter**
	* `lst` : 매개변수로 들어오는 함수를 적용할 대상 리스트 주소
	* `(*f)(void*)` : 리스트 멤버 변수에 적용 시킬 함수 포인터
	* `(*del)(void *)` : 빈 리스트를 지우기 위한 함수 포인터
* **Return Value**
	* 새롭게 생성된 리스트 주소 반환 
