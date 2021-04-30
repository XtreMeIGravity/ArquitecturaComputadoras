	.file	"Practica1.c"
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Introduce el tamano del arreglo\0"
.LC1:
	.ascii "%d\0"
.LC2:
	.ascii "Sorted array: \0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
	movl	$0, -12(%rbp)
	leaq	.LC0(%rip), %rcx
	call	puts
	leaq	-12(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rcx
	call	scanf
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -8(%rbp)
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	LLenaArreglo
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	ImpArreglo
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	bubbleSort
	leaq	.LC2(%rip), %rcx
	call	puts
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	ImpArreglo
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	LLenaArreglo
	.def	LLenaArreglo;	.scl	2;	.type	32;	.endef
	.seh_proc	LLenaArreglo
LLenaArreglo:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -48(%rbp)
	movl	%edx, -40(%rbp)
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
	movl	$0, -84(%rbp)
	jmp	.L4
.L5:
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	call	rand
	movl	%eax, %ecx
	movl	$1759218605, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$11, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$5000, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, (%rbx)
	addl	$1, -84(%rbp)
.L4:
	movl	-84(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L5
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "%d|\0"
	.text
	.globl	ImpArreglo
	.def	ImpArreglo;	.scl	2;	.type	32;	.endef
	.seh_proc	ImpArreglo
ImpArreglo:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	$124, %ecx
	call	putchar
	movl	$0, -4(%rbp)
	jmp	.L7
.L8:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	leaq	.LC3(%rip), %rcx
	call	printf
	addl	$1, -4(%rbp)
.L7:
	movl	-4(%rbp), %eax
	cmpl	24(%rbp), %eax
	jl	.L8
	movl	$10, %ecx
	call	putchar
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	intercambia
	.def	intercambia;	.scl	2;	.type	32;	.endef
	.seh_proc	intercambia
intercambia:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	24(%rbp), %rax
	movl	(%rax), %edx
	movq	16(%rbp), %rax
	movl	%edx, (%rax)
	movq	24(%rbp), %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	bubbleSort
	.def	bubbleSort;	.scl	2;	.type	32;	.endef
	.seh_proc	bubbleSort
bubbleSort:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L11
.L15:
	movl	$0, -8(%rbp)
	jmp	.L12
.L14:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L13
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	call	intercambia
.L13:
	addl	$1, -8(%rbp)
.L12:
	movl	24(%rbp), %eax
	subl	-4(%rbp), %eax
	subl	$1, %eax
	cmpl	-8(%rbp), %eax
	jg	.L14
	addl	$1, -4(%rbp)
.L11:
	movl	24(%rbp), %eax
	subl	$1, %eax
	cmpl	-4(%rbp), %eax
	jg	.L15
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (tdm64-1) 5.1.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	time;	.scl	2;	.type	32;	.endef
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
