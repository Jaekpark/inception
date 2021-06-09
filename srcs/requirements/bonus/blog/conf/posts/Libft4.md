---

title: "Libft 4"

preview: "substr, strjoin, strtrim, split, itoa, putchar_fd, putendl_fd, putnbr_fd"

date: "2021-06-08"

author: "jaekpark"

previous: "Libft3"

next: "Linked-list"

coverUrl: "https://www.asidesigned.com/images/programming-projects-img/project-libft.jpg"

---

## ft_substr

* **Synopsis**
```c
char	*ft_substr(char const *s, unsigned int start, size_t len)
{
	size_t i;
	char *result;

	i = 0
	if (!s)
		return (NULL);
	if (ft_strlen(s) < start)
	{
		result = malloc(sizeof(char) * 1);
		result[0] = '\0';
		return (result);
	}
	if (!(result = malloc(sizeof(char) * (len + 1))))
		return (NULL);
	while (i < len)
	{
		result[i] = s[start + i];
		i++;
	}
	result[i] = '\0';
	return (result);
}
```

* **Description**
	+ 문자열 자르기 함수
	+ 대상 문자열을 특정 인덱스부터 원하는 길이 만큼 자른다.

* **Parameter**
	+ `s` : 자르기의 대상이 되는 문자열
	+ `start` : 자르기 시작할 위치 인덱스
	+ `len` : `start`부터 자를 문자의 개수

* **Return Value**
	+ 자른 문자열이 새롭게 저장된 메모리 블럭 주소 포인터 변수

## ft_strjoin

* **Synopsis**
```c
char	*ft_substr(char const *s1, char const *s2)
{
	size_t	i;
	size_t	j;
	char	*result;

	i = 0;
	j = 0;
	if (!s1 || !s2)
		return (NULL);
	if (!(result = malloc(sizeof(char) * (ft_strlen(s1) + ft_strlen(s2) + 1))))
		return (NULL);
	while (s1[i])
	{
		result[i] = s1[i];
		i++;
	}
	while (s2[j])
	{
		result[i++] = s2[j];
		j++;
	}
	result[i] = '\0';
	return (result);
}
```

* **Description**
	+ 두 문자열을 하나로 합치는 함수

* **Parameter**
	+ `s1` ,`s2` : 합칠 대상 문자열

* **Return Value**
	+ 두 문자열이 저장되어 있는 메모리 블러 주소 포인터 변수

## ft_strtrim

+ **Synopsis**
```c
char	*ft_strtrim(char const *s1, char const *set)
{
	size_t	start;
	size_t	end;
	size_t	buffer_size;
	char	*result;

	start = 0;
	if (!s1 || !set)
		return (NULL);
	while (s1[start] && ft_strchr(set, s1[start]))
		start++;
	if (s1[start] == '\0')
	{
		result = malloc(sizeof(char) * 1);
		result[0] = '\0';
		return (result);
	}
	end =ft_strlen(s1) - 1;
	while (s1[end] && ft_strchr(set, s1[end]))
		end--;
	buffer_size = end - start + 1;
	if (!(result = malloc(sizeof(char) * (buffer_size + 1))))
		return (NULL);
	ft_strlcpy(result, &s1[start], buffer_size + 1);
	return (result);
}
```

* **Description**
	+ 대상 문자열에서 특정 문자를 삭제하는 함수

* **Parameter**
	+ `s1` :  대상 문자열
	+ `set` : 대상 문자열에서 삭제할 문자의 집합 

* **Return Value**
	+ 특정 문자가 삭제된 새로운 문자열

## ft_split

* **Synopsis**
```c
int		word_count(char const *s, char c)
{
	int	count;
	int	i;

	count = 0;
	i = 0;
	while (s[i])
	{
		if (s[i] != c && (s[i + 1] == c || s[i + 1] == '\0')
			count++;
		i++;
	}
	return (count);
}

int		*word_size(char const *s, char c)
{
	int	*arr;
	int	size;
	int	i;
	int	j;

	if (!(arr = malloc(sizeof(int) * word_count(s, c))))
		return (NULL);
	size = 0;
	j = 0;
	i = 0;
	while (s[i])
	{
		if (s[i] != c)
		{
			size++;
			if (s[i + 1] == c || s[i + 1] == '\0')
			{
				arr[j] = size;
				size = 0;
				j++;
			}
		}
		i++;
	}
	return (arr);
}

void	mem_allocate(char **dest, int *size, int count)
{
	int	i;

	i = 0;
	dest[count] = NULL;
	while (count)
	{
		dest[i] = malloc(sizeof(char) * size[i] + 1);
		i++;
		count--;
	}
}

char	**ft_split(char const *s, char c)
{
	int	i;
	int	j;
	int k;
	int	*size;
	char **dest;
	
	if (!s || !(dest = (char **)malloc(sizeof(char *) * word_count(s, c) + 1)))
		return (NULL);
	size = word_size(s, c);
	mem_allocate(dest, size, word_count(s, c));
	i = -1;
	j = 0;
	k = 0;
	while (s[++i])
		if (s[i] != c)
		{
			dest[j][k++] = s[i];
			if (s[i + 1] == c || s[i + 1] == '\0')
			{
				dest[j++][k] = '\0';
				k = 0;
			}
		}
	free(size);
	return (dest)
}
```

* **Description**
	+ 대상 문자열을 특정 문자를 기준으로 나누는 함수
* **Additonal Fuctions for ft_split**
	+ **word_count**
	
    ```c
	int	word_count (char const *s, char c)
	```
	
    나눠질 문자열의 개수를 구하는 함수
	
	+ **word_size**
	
    ```c
	int *word_size(char const *s, char c)
	```
	
    나눠진 문자열의 각 문자 수를 구해 `int`배열 형태로 저장하는 함수
	
    **mem_allocate**
	
    ```c
	void mem_alloate(char **dest, int *size, int count)
	  ```
	
    나눠진 각 문자열이 담길 포인터 변수에 각 문자열의 사이즈 만큼 동적 메모리 할당을 하는 함수

* **Parameter**
	* `s` : 나눌 대상이 되는 문자열
	* `c` : 문자열을 나눌 기준이 되는 문자

* **Return Value**
	+ 나눠진 결과 값이 저장되어 있는 메모리 주소를 갖는 이중 포인터 변수 반환

## ft_itoa

* **Synopsis**
```c
int		arr_size(int n)
{
	int	count;

	count = 1;
	while (1)
	{
		if (n / 10 == 0)
			break ;
		n /= 10;
		count++;
	}
	return (count);
}

char	*ft_itoa(int n)
{
	char	*dst;
	int		dstsize;
	
	dstsize = n < 0 ? arr_size(n) + 2 : arr_size(n) + 1;
	if (!(dst = malloc(sizeof(char) * dstsize)))
		return (NULL);
	dst[--dstsize] = '\0';
	if (n < 0)
	{
		dst[0] = '-';
		if (n == -2147483648)
		{
			dst[i] = '2';
			n = -147483648;
		}
		n *= -1;
	}
	while (1)
	{
		dst[--dstsize] = n % 10 + '0';
		n /= 10;
		if (n == 0)
			break ;
	}
	return (dst);
}		
```

* **Description**
	* `int`형 변수의 값인 수를  `char`형 문자열 형태로 변환하는 함수

* **Additional Functions for ft_itoa**
	```c
	int	arr_size(int n)
	```
	>  숫자의 각 단위를 문자열 형태로 변환하기 위해 자리 수 카운트를 구하는 함수

* **Return Value**
	* `int`형 정수를 문자열 형태로 변환해 저장한 메모리 블럭을 가리키는 포인터 변수 반환

## ft_strmapi
* **Synopsis**
```c
char	*ft_strmapi(char const *s, char (*f)(unsigned int, char)
{
	char	*dst;
	unsigned int i;
	if (!s || !f)
		return (NULL);
	i = ft_strlen(s);
	if (!(dst = malloc(sizeof(char) * i + 1)))
		return (NULL);
	i = 0;
	while (s[i])
	{
		dst[i] = f(i ,s[i]);
		i++;
	}
	dst[i] = '\0';
	return (dst);
}
```

* **Description**
	* 매개 변수로 들어오는 문자열에 매개 변수로 들어오는 함수를 적용시키는 함수

* **Parameter**
	+ `s` : 함수를 적용시킬 대상 문자열
	+ `(*f)(unsigned int, char)` : 대상 문자열에 적용할 함수

* **Return Value**
	* 함수가 적용된 새로운 문자열을 반환

## ft_putchar_fd
* **Synopsis**
```c
void	ft_putchar_fd(char c, int fd)
{
	if (fd < 0)
		return ;
	write(fd, &c, 1);
}
```

* **Description**
	* 문자 출력 함수
	* 매개변수로 들어오는 문자를 **File Descriptor**로 보내는 함수

* **Parameter**
	* `c` : fd로 쓰기 할 문자
	* `fd` : `c`를 파일 쓰기할 **File Descriptor**

## ft_putstr_fd
* **Synopsis**
```c
void	ft_putstr_fd(char *s, int fd)
{
	if (!s || fd < 0)
		return ;
	while (*s)
	{
		ft_putchar_fd(*s, fd);
		s++;
	}
}
```

* **Description**
	* 문자열 쓰기 함수
	* 매개 변수로 들어오는 문자열을 **fd**에 파일 쓰기하는 함수

* **Parameter**
	* `s` : **fd**에 쓰기 할 문자열
	* `fd` : 파일 쓰기할 **fd**

## ft_putendl_fd
* **Synopsis**
```c
void	ft_putendl_fd(char *s, int fd)
{
	if (fd < 0 || !s)
		return ;
	ft_putstr_fd(s, fd);
	write(fd, "\n", 1);
}
```
* **Description**
	* 문자열 쓰기 함수
	* 대상 문자열을 쓰기하고 줄바꿈하는 함수

* **Parameter**
	* `s` : **fd**에 쓰기 할 문자열
	* `fd` : 파일 쓰기할 **fd**

## ft_putnbr_fd

* **Synopsis**
```c
void	ft_putnbr_fd(int n, int fd)
{
	if (fd < 0)
		return ;
	if (n >= 0 && n < 10)
	{
		ft_putchar_fd(n + '0', fd);
		return ;
	}
	else if (n > 9)
	{
		ft_putnbr_fd(n / 10, fd);
		ft_putchar_fd(n % 10 + '0', fd);
	}
	else if (n < 0 && n != -2147483648)
	{
		ft_putchar_fd('-', fd);
		ft_putnbr_fd(-n, fd);
	}
	else if (n == -2147483648)
	{
		ft_putchar_fd('-', fd);
		ft_putchar_fd('2', fd);
		ft_putnbr_fd(147483648, fd);
	}
}
```

* **Description**
	* 숫자 쓰기 함수
	* 매개 변수로 들어오는 `int`형 수를 fd에 파일 쓰기하는 함수

* **Parameter**
	* `n` : 쓰기 할 대상 수
	* `fd` : 파일 쓰기할 대상 **fd**
