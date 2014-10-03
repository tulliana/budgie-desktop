-include $(top_srcdir)/common.mk

lib_LTLIBRARIES = libbudgiecore.la

libbudgiecore_la_SOURCES = \
	BudgiePopover.vala \
	BudgieInterfaces.vala

libbudgiecore_la_CFLAGS = \
	$(GTK3_CFLAGS)

libbudgiecore_la_LIBADD = \
	$(GTK3_LIBS)

libbudgiecore_la_VALAFLAGS = \
	--pkg gtk+-3.0 \
	--vapi=BudgieCore.vapi \
	$(VALAFLAGS) \
	-H BudgieCore.h


dist-hook:
	cd $(distdir) && \
	rm $(libbudgiecore_la_SOURCES:.vala=.c) libbudgiecore_la_vala.stamp
