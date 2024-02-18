/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasmmodule.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/30 19:05:32 by vmonteco          #+#    #+#             */
/*   Updated: 2023/06/30 22:15:05 by vmonteco         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PY_SSIZE_T_CLEAN
# define PY_SSIZE_T_CLEAN
# include <Python.h>

static PyObject ft_strlen(PyObject *self, PyObject *args){
	const char *commmand;
	int sts;

	if (!PyArg_ParseTuple(args, "s", &command)){
		return NULL;
	}
	sts = system(command);

	return PyLong_FromLong(sts);
}

#endif
