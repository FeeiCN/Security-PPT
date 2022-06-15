 

·
· ·
·
·
·
· ·
·

Issuer Audience Expire Date Claims Signature

Issuer Audience Expire Date Claims Signature

// System.IdentityModel.Tokens.X509AsymmetricSecurityKey public override HashAlgorithm GetHashAlgorithmForSignature(string algorithm) {
... object algorithmFromConfig = CryptoHelper.GetAlgorithmFromConfig(algorithm); ...
// System.IdentityModel.CryptoHelper internal static object GetAlgorithmFromConfig(string algorithm) {
... obj = CryptoConfig.CreateFromName(algorithm); ... }

// System.Security.Cryptography.CryptoConfig public static object CreateFromName(string name, params object[] args) {
... if (type == null) {
type = Type.GetType(name, false, false); if (type != null && !type.IsVisible) type = null; } ... RuntimeType runtimeType = type as RuntimeType; ... MethodBase[] array = runtimeType.GetConstructors(BindingFlags.Instance | BindingFlags.Public | BindingFlags.CreateInstance); ... object obj; RuntimeConstructorInfo runtimeConstructorInfo = Type.DefaultBinder.BindToMethod(BindingFlags.Instance | BindingFlags.Public | BindingFlags.CreateInstance, array, ref args, null, null, null, out obj) ... object result = runtimeConstructorInfo.Invoke(BindingFlags.Instance | BindingFlags.Public | BindingFlags.CreateInstance, Type.DefaultBinder, args, null);

<saml:Assertion ...> ... <ds:Signature xmlns:ds="http://www.w3.org/2000/09/xmldsig#"> <ds:SignedInfo> <ds:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/> <ds:SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/> ... </ds:SignedInfo> <ds:SignatureValue>WNKeaE3R....SLMRLfIN/zI=</ds:SignatureValue> ...
</ds:Signature> </saml:Assertion>
// System.IdentityModel.SignedXml public void StartSignatureVerification(SecurityKey verificationKey) {
string signatureMethod = this.Signature.SignedInfo.SignatureMethod; ... using (HashAlgorithm hash = asymmetricKey.GetHashAlgorithmForSignature(signatureMethod)) ...

· ·
·
·
·
·
// System.Web.Mobile.CookielessData public CookielessData() {
string formsCookieName = FormsAuthentication.FormsCookieName; string text = HttpContext.Current.Request.QueryString[formsCookieName]; ... {
FormsAuthenticationTicket tOld = FormsAuthentication.Decrypt(text);

·
·
·
·

·
·

·
·

·

·

·

·



// Microsoft.Exchange.Search.Fast.FastManagementClient static FastManagementClient() {
... AppDomain.CurrentDomain.AssemblyResolve += new ResolveEventHandler(OnAssemblyResolveEvent); }
// Microsoft.Exchange.Search.Fast.FastManagementClient private static Assembly OnAssemblyResolveEvent(object sender, ResolveEventArgs args) {
string name = args.Name.Split(new char[]{','})[0]; string path1 = Path.Combine(FastManagementClient.fsisInstallPath, "Installer\\Bin"); string path2 = Path.Combine(FastManagementClient.fsisInstallPath, "HostController"); string[] paths = new string[] {path1,path2}; for (int i = 0; i < paths.Length; i++) {
string full_path = paths[i] + Path.DirectorySeparatorChar.ToString() + name + ".dll"; if (File.Exists(full_path)) return Assembly.LoadFrom(full_path); ...

... ...

SecurityKey
SecurityToken
SecurityToken

SecurityKey
SecurityToken
SecurityToken

· System.IdentityModel.Selectors.SecurityTokenResolver

·
·
·

1. 2. 3.

· ·
· · ·

// System.IdentityModel.Tokens.SamlAssertion SecurityKeyIdentifier keyIdentifier = signedXml.Signature.KeyIdentifier; this.verificationKey = SamlSerializer.ResolveSecurityKey(keyIdentifier, outOfBandTokenResolver); if (this.verificationKey == null) throw ... this.signature = signedXml; this.signingToken = SamlSerializer.ResolveSecurityToken(keyIdentifier, outOfBandTokenResolver);

// System.IdentityModel.Tokens.SamlSerializer internal static SecurityKey ResolveSecurityKey(SecurityKeyIdentifier ski, SecurityTokenResolver tokenResolver) {
if (ski == null) throw DiagnosticUtility.ExceptionUtility.ThrowHelperArgumentNull("ski"); if (tokenResolver != null) {
for (int i = 0; i < ski.Count; i++) { SecurityKey result = null; if (tokenResolver.TryResolveSecurityKey(ski[i], out result)) { return result; }
} } ...

// System.ServiceModel.Security.AggregateSecurityHeaderTokenResolver bool TryResolveSecurityKeyCore(SecurityKeyIdentifierClause keyIdentifierClause, out SecurityKey key) {
...
resolved = this.tokenResolver.TryResolveSecurityKey(keyIdentifierClause, false, out key); if (!resolved)
resolved = base.TryResolveSecurityKeyCore(keyIdentifierClause, out key); if (!resolved)
resolved = SecurityUtils.TryCreateKeyFromIntrinsicKeyClause(keyIdentifierClause, this, out key);

// System.ServiceModel.Security.AggregateSecurityHeaderTokenResolver override bool TryResolveTokenCore(SecurityKeyIdentifier keyIdentifier, out SecurityToken token) {
bool resolved = false; token = null; resolved = this.tokenResolver.TryResolveToken(keyIdentifier, false, false, out token); if (!resolved) resolved = base.TryResolveTokenCore(keyIdentifier, out token); if (!resolved) {
for (int i = 0; i < keyIdentifier.Count; ++i) { if (this.TryResolveTokenFromIntrinsicKeyClause(keyIdentifier[i], out token)) { resolved = true; break; }

...

· ·
Auth Token

·
if (!tokenResolver.TryResolveSecurityKey(_signedXml.Signature.KeyIdentifier[0], out key)) {
... }
·
foreach (SecurityKeyIdentifierClause securityKeyIdentifierClause in keyIdentifier) { ...
}

· System.IdentityModel.Tokens.IssuerTokenResolver

·

·

X509CertificateStoreTokenResolver

· ResolveSecurityKey()

EncryptedKeyIdentifierClause

· ResolveToken()

·
·
·
·

X509 Certificate
Store

... ...

·

·

· Microsoft.SharePoint.IdentityModel.SPIssuerTokenResolver

·

...

·

· ·

· · ·

·
·
· · ·
·

@Pwntester @OlekMirosh

