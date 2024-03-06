import { useRef } from 'react';
import InputError from '@/Components/InputError';
import InputLabel from '@/Components/InputLabel';
import PrimaryButton from '@/Components/PrimaryButton';
import TextInput from '@/Components/TextInput';
import { useForm } from '@inertiajs/react';
import { Transition } from '@headlessui/react';

export default function UpdatePasswordForm({ className = '' }) {
    const passwordInput = useRef();
    const currentPasswordInput = useRef();

    const { data, setData, errors, put, reset, processing, recentlySuccessful } = useForm({
        current_password: '',
        password: '',
        password_confirmation: '',
    });

    const updatePassword = (e) => {
        e.preventDefault();

        put(route('password.update'), {
            preserveScroll: true,
            onSuccess: () => reset(),
            onError: (errors) => {
                if (errors.password) {
                    reset('password', 'password_confirmation');
                    passwordInput.current.focus();
                }

                if (errors.current_password) {
                    reset('current_password');
                    currentPasswordInput.current.focus();
                }
            },
        });
    };

    return (
        <section className={className}>
            <header>
                <h2 className="profile0">Cambiar contraseña</h2>

                <p className="profile1">
                    *Usa contraseñas seguras, se recomiendan un mínimo de 8 caracteres, así como el uso combinado de mayúsculas, minúsculas, números y caracteres especiales.
                </p>
            </header>

            <form onSubmit={updatePassword} className="profile-name">
                <div>
                    <InputLabel htmlFor="current_password" value="Contraseña actual" />

                    <TextInput
                        id="current_password"
                        ref={currentPasswordInput}
                        value={data.current_password}
                        onChange={(e) => setData('current_password', e.target.value)}
                        type="password"
                        className="log2"
                        autoComplete="current-password"
                    />

                    <InputError message={errors.current_password} className="log23" />
                </div>

                <div>
                    <InputLabel htmlFor="password" value="Nueva contraseña" />

                    <TextInput
                        id="password"
                        ref={passwordInput}
                        value={data.password}
                        onChange={(e) => setData('password', e.target.value)}
                        type="password"
                        className="log2"
                        autoComplete="new-password"
                    />

                    <InputError message={errors.password} className="log23" />
                </div>

                <div>
                    <InputLabel htmlFor="password_confirmation" value="Confirmar nueva contraseña" />

                    <TextInput
                        id="password_confirmation"
                        value={data.password_confirmation}
                        onChange={(e) => setData('password_confirmation', e.target.value)}
                        type="password"
                        className="log2"
                        autoComplete="new-password"
                    />

                    <InputError message={errors.password_confirmation} className="log23" />
                </div>

                <div className="profile4">
                    <PrimaryButton disabled={processing}>Guardar</PrimaryButton>

                    <Transition
                        show={recentlySuccessful}
                        enter="transition ease-in-out"
                        enterFrom="opacity-0"
                        leave="transition ease-in-out"
                        leaveTo="opacity-0"
                    >
                        <p className="profile5">Guardando...</p>
                    </Transition>
                </div>
            </form>
        </section>
    );
}
