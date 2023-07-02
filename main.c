/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/12 05:14:14 by vmonteco          #+#    #+#             */
/*   Updated: 2023/07/01 23:57:34 by vmonteco         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include "libasm.h"

void	test_ft_strlen(void){
	size_t		i;
	char		*s;
	
	/*
	** NULL case is undefined behaviour :
	** https://www.open-std.org/Jtc1/sc22/WG14/www/docs/dr_451.htm
	*/

	/* Empty string */
	s = malloc(1*sizeof(char));
	if (s){
		s[0] = 0;
		printf("-ft_strlen with empty str :\nExpected_result : %d.\nGot %zd.\nstrlen returns %zd.\n", 0, ft_strlen(s), strlen(s));
		free(s);
	}else{
		printf("-ft_strlen with empty str : Unsuccessful allocation\n.");
	}

	/* Non empty string */
	s = malloc((42+1)*sizeof(char));
	if (s){
		i = 0;
		while (i < 42){
			s[i] = 'a';
			i++;
		}
		s[i] = 0;
		printf("-ft_strlen with non empty str :\nExpected_result : %d.\nGot %zd.\nstrlen returns %zd.\n", 42, ft_strlen(s), strlen(s));
		free(s);
	}else{
		printf("-ft_strlen with non empty str : Unsuccessful allocation\n.");
	}	
}


int		test_ft_strcpy(void)
{
	char	*std;
	char	*libasm;

	std = strnew(strlen("FOO"));
	libasm = strnew(strlen("FOO"));
	
}

int		main(void)
{
	test_ft_strlen();
	return (0);
}
