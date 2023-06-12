NAME =		libasm.a
AS =		nasm

SRC =		ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s

BONUS_SRC =	ft_atoi_base.s \
			ft_list_push_front.s \
			ft_list_size.s \
			ft_list_sort.s \
			ft_list_remove_if.s

OBJ =		$(subst .s,.o,$(SRC))
BONUS_OBJ =	$(subst .s,.o,$(BONUS_SRC))


all: $(NAME)

$(NAME): $(OBJ)

%.o: %.s
	$(AS) $@ %^

test_exe:

test: test_exe
	./$<

test_bonus_exe:

bonus: test_bonus_exe
	./$<

.PHONY: test bonus

clean:
	rm $(OBJ)

fclean: clean
	rm $(NAME)

re: fclean all
