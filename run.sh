if ! type nodebrew &> /dev/null; then
  fail "nodebrew is not installed";
fi

if [ -z "$WERCKER_NODEBREW_USE_VERSION" ]; then
  fail "version is not set";
fi

if [ "$WERCKER_NODEBREW_USE_CREATE" = "true" ]; then
  if [ -z "`nodebrew list | grep $WERCKER_NODEBREW_USE_VERSION`" ]; then
    nodebrew install-binary $WERCKER_NODEBREW_USE_VERSION
  fi
fi

result=`nodebrew use $WERCKER_NODEBREW_USE_VERSION`

if [[ $? -ne 0 ]]; then
  fail "$result"
else
  success "$result"
fi
