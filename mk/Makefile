include $(B_BASE)/common.mk
include $(B_BASE)/rpmbuild.mk

REPO = $(call hg_loc,guest_templates)
RPM_BINDIR = $(RPM_RPMSDIR)/$(DOMAIN0_ARCH_OPTIMIZED)

.PHONY: build
build: srpm $(MY_SOURCES)/MANIFEST
	$(RPMBUILD) --target $(DOMAIN0_ARCH_OPTIMIZED) -bb $(RPM_SPECSDIR)/guest-templates.spec
	mkdir -p $(MY_OUTPUT_DIR) $(MY_MAIN_PACKAGES)
	# Deliberately omit the debuginfo RPM (v6d-debuginfo-0...)
	cp $(RPM_BINDIR)/guest-templates-0*.rpm $(MY_MAIN_PACKAGES)

.PHONY: srpm
srpm:
	mkdir -p $(RPM_SRPMSDIR) $(RPM_SPECSDIR) $(RPM_SOURCESDIR) $(RPM_RPMSDIR)
	hg archive -p guest-templates-0 -t tbz2 $(RPM_SOURCESDIR)/guest-templates-0.tar.bz2
	install ../guest-templates.spec $(RPM_SPECSDIR)
	$(RPMBUILD) --target $(DOMAIN0_ARCH_OPTIMIZED) -bs $(RPM_SPECSDIR)/guest-templates.spec

$(MY_SOURCES)/MANIFEST: $(MY_SOURCES_DIRSTAMP)
	rm -f $@
	/bin/sh ./srpms-to-manifest guest-templates $(MY_OUTPUT_DIR)/SRPMS > $@

.PHONY: clean
clean:
	rm -f $(OUTPUT)
	$(MAKE) -C $(REPO) clean
